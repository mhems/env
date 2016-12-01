#!/usr/bin/env python3

import sys
import argparse

'''Color text for terminal output'''

ESCAPE_CHAR = chr(27)

FORMATS = {
    'normal' : 0,
    'bold' : 1,
    'dim' : 2,
    'underscore' : 4,
    'inverse' : 7
}

RESET_FORMATS = {
    'normal' : 0,
    'bold' : 21,
    'dim' : 22,
    'underscore' : 24,
    'inverse' : 27
}

FOREGROUND_COLORS = {
    'default' : 39,
    'black' : 30,
    'red' : 31,
    'green' : 32,
    'yellow' : 33,
    'blue' : 34,
    'magenta' : 35,
    'cyan' : 36,
    'light gray' : 37,
    'dark gray' : 90,
    'light red' : 91,
    'light green' : 92,
    'light yellow' : 93,
    'light blue' : 94,
    'light magenta' : 95,
    'light cyan' : 96,
    'white' : 97
}

BACKGROUND_COLORS = {
    'default' : 49,
    'black' : 40,
    'red' : 41,
    'green' : 42,
    'yellow' : 43,
    'blue' : 44,
    'magenta' : 45,
    'cyan' : 46,
    'light gray' : 47,
    'dark gray' : 100,
    'light red' : 101,
    'light green' : 102,
    'light yellow' : 103,
    'light blue' : 104,
    'light magenta' : 105,
    'light cyan' : 106,
    'white' : 107
}


class ColorBuffer:
    '''
    Class for building colorized strings.
    If stdout is not a tty, coloring requests are ignored
    '''

    def __init__(self, allow=None):
        '''initialize empty buffer'''
        self.buffer = ""
        if allow is not None:
            self.allow = allow
        else:
            self.allow = sys.stdout.isatty()

    def __append_code(self, fmt_code):
        '''append escaped `fmt_code` to buffer'''
        if self.allow:
            self.buffer += '{}[{}m'.format(ESCAPE_CHAR, fmt_code)

    def set_format(self, fmt):
        '''set format `fmt` code'''
        self.__append_code(FORMATS[fmt])

    def reset_format(self, fmt = 'normal'):
        '''clear format `fmt` code'''
        self.__append_code(RESET_FORMATS[fmt])

    def set_foreground_color(self, color = 'default'):
        '''set foreground color'''
        self.__append_code(FOREGROUND_COLORS[color])

    def set_background_color(self, color = 'default'):
        '''set background color'''
        self.__append_code(BACKGROUND_COLORS[color])

    def append(self, text, *fmts, **colors):
        '''append `text` to buffer with colors and formats as given'''
        fg_color = None
        bg_color = None
        for color in colors:
            if color == 'fg_color':
                fg_color = colors[color]
            elif color == 'bg_color':
                bg_color = colors[color]

        if self.allow:
            if fg_color:
                self.set_foreground_color(fg_color)
            if bg_color:
                self.set_background_color(bg_color);
            for fmt in fmts:
                self.set_format(fmt)
        self.buffer += text
        if self.allow:
            if fg_color:
                self.set_foreground_color()
            if bg_color:
                self.set_background_color();
            for fmt in fmts:
                self.reset_format(fmt)

    def __str__(self):
        '''return colorized text as string'''
        return self.buffer


def main():
    '''CLI for colorizing text'''
    parser = argparse.ArgumentParser(description='Terminal Text Colorizer')
    parser.add_argument('-b',
                        action = 'store_const',
                        const = 'bold',
                        help = 'bold format')
    parser.add_argument('-d',
                        action = 'store_const',
                        const = 'dim',
                        help = 'dim format')
    parser.add_argument('-u',
                        action = 'store_const',
                        const = 'underscore',
                        help = 'underscore format')
    parser.add_argument('-fg',
                        metavar = 'FOREGROUND_COLOR',
                        help = 'foreground color')
    parser.add_argument('-bg',
                        metavar = 'BACKGROUND_COLOR',
                        help = 'background color')
    parser.add_argument('--color',
                        metavar = 'WHEN',
                        nargs = '?',
                        const = 'always',
                        choices = ['always', 'auto', 'never'],
                        help = """colorize the output;
                                  WHEN can be 'always' (default if omitted),
                                              'auto' (on by default) or
                                              'never'""")
    parser.add_argument('TEXT',
                        nargs = '*',
                        help = 'words to colorize')
    args = parser.parse_args()

    if args.color == 'always':
        allow = True
    elif args.color == 'never':
        allow = False
    else:
        allow = None

    cb = ColorBuffer(allow)

    fmts = (arg for arg in (args.b, args.d, args.u) if arg)

    if args.TEXT:
        words = args.TEXT
    else:
        words = [w.strip() for w in sys.stdin]

    cb.append(' '.join(words), *fmts, fg_color = args.fg, bg_color = args.bg)

    print(cb)


if __name__ == '__main__':
    main()
