local checker = require 'WordChecker'
checker:create()

local testStr = 'xxoo 123 sb'
print(checker:isWarningInPutStr(testStr))
print(checker:warningStrGsub(testStr))
