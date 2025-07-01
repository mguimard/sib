def replaceHelloWith(str, repl):
    return str.replace('hello', repl)


class FilterModule(object):
    def filters(self):
        return {
            'replaceHelloWith': replaceHelloWith
        }