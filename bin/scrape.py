#!/usr/bin/env python3

import sys
from argparse import ArgumentParser

try:
    from bs4 import BeautifulSoup
except ImportError:
    print('Cannot find class BeautifulSoup in module bs4\n'
          'Check your PYTHONPATH or download it at https://www.crummy.com/software/BeautifulSoup/',
          file=sys.stderr)
    sys.exit(1)

def make_search_function(tag_name, attr, id_, class_):
    def make_match_function(given, expr):
        if given is None:
            return lambda _ : True
        else:
            return expr
    def make_match_attr_function(attr, exp):
        def match_attr(tag):
            return tag.has_attr(attr) and tag[attr] == exp
        return match_attr
    match_tag = make_match_function(tag_name, lambda tag: tag.name == tag_name)
    match_attr = make_match_function(attr, lambda tag: tag.has_attr(attr))
    match_id = make_match_function(id_, make_match_attr_function('id', id_))
    match_cls = make_match_function(class_,
                                    make_match_attr_function('class', class_))
    def search(tag):
        return all((match_tag(tag), match_attr(tag),
                    match_id(tag),  match_cls(tag)))
    return search

def main(args):
    output = sys.stdout
    if args.output is not None:
        output = open(args.output, 'w')

    if args.url:
        args.tag = 'a'
        args.attribute = 'href'

    for file_ in args.FILES:
        with open(file_, 'r') as html_file:
            soup = BeautifulSoup(html_file)
        if args.prettyprint:
            print(soup.prettify(), file=output)
        elif args.text:
            print(soup.get_text(), file=output)
        else:
            results = soup.find_all(make_search_function(args.tag,
                                                         args.attribute,
                                                         args.id,
                                                         args.class_))
            if args.attribute is not None:
                for result in results:
                    print(result[args.attribute], file=output)
            else:
                for result in results:
                    print(result.get_text(), file=output)

    if args.output is not None:
        output.close()

if __name__ == '__main__':
    parser = ArgumentParser(description='simple CLI for HTML scraping via beautifulsoup4')
    def add_arg(short_name, long_name, meta_name, help_msg):
        parser.add_argument('-' + short_name, '--' + long_name,
                            default=None, metavar=meta_name, help=help_msg)
    def add_flag(short_name, long_name, help_msg):
        parser.add_argument('-' + short_name, '--' + long_name,
                            default=False, action='store_true', help=help_msg)
    add_arg('o', 'output', 'FILE', 'file to write output to')
    add_arg('t', 'tag', 'TAG', 'include only tags whose name matches TAG')
    add_arg('a', 'attribute', 'ATTR',
            'include only tags with an attribute that matches ATTR')
    add_arg('i', 'id', 'ID', 'include only elements whose id matches ID')
    add_arg('c', 'class_', 'CLASS',
            'include only elements whose class matches CLASS')
    add_flag('p', 'prettyprint', 'pretty print original webpage')
    add_flag('T', 'text', 'print enclosed text')
    add_flag('u', 'url', 'print href links, equivalent to -t a -a href')
    parser.add_argument('FILES',
                        nargs = '+',
                        help = 'files to scrape')
    args = parser.parse_args()
    main(args)
