#!/usr/bin/env python3

from sys import stdin
from re import compile, search
from argparse import ArgumentParser

# For usage, provide '-h' flag

if __name__ == '__main__':
    parser = ArgumentParser(description="Frequency Summarizer")
    parser.add_argument('-F',
                        default = None,
                        metavar = 'FS',
                        help = 'separate columns by FS')
    parser.add_argument('-c',
                        default = [0],
                        metavar = 'INDEX',
                        nargs = '+',
                        type = int,
                        help = 'pull numbers from column(s) INDEX')
    parser.add_argument('-i',
                        default = False,
                        action = 'store_true',
                        help = 'ignore change in case')
    parser.add_argument('-b',
                        default = False,
                        action = 'store_true',
                        help = 'ignore change in whitespace')
    parser.add_argument('-H',
                        default = False,
                        action = 'store_true',
                        help = 'treat first line of each file as a header')
    parser.add_argument('-I',
                        default = None,
                        metavar = 'RE',
                        help = 'ignore data matching RE regex')
    parser.add_argument('DATA',
                        nargs = '*',
                        help = 'files to operate on or stdin if None')
    args = parser.parse_args()

    indices = args.c
    files = args.DATA
    if len(files) > 0:
        for i, f in enumerate(files):
            files[i] = open(f, 'r')
    else:
        files.append(stdin)
    regex = None
    if args.I:
        regex = compile(args.I)
    freq_list = [dict() for _ in range(len(indices))]
    header_cells = None
    for i, f in enumerate(files):
        if args.H:
            header_cells = list(map(str.strip,
                                    f.readline().strip().split(args.F)))
        for line in f:
            line = line.strip()
            cells = line.split(args.F)
            if args.i:
                cells = list(map(str.lower, cells))
            if args.b:
                cells = list(map(str.strip, cells))
            if (regex is not None and
                any(search(regex, cell) for cell in cells)):
                continue
            for i, index in enumerate(indices):
                if index < len(cells):
                    cell = cells[index]
                    if cell in freq_list[i]:
                        freq_list[i][cell] += 1
                    else:
                        freq_list[i][cell] = 1
    for i, index in enumerate(indices):
        if header_cells:
            print(header_cells[index] + ':')
        items = [(k, v) for k, v in freq_list[i].items()]
        items.sort(reverse=True, key=lambda i : i[1])
        max_len = len(str(items[0][1]))
        fmt_str = '  %%%dd   %%s' % max_len
        for category, count in items:
            print(fmt_str % (count, category))
        if i < len(indices) - 1:
            print()
    for f in files:
        f.close()
