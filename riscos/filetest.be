# Simple test that we can access files.

import os
import string

class VersionNum
    var filename
    var defines

    def init(filename)
        self.filename = filename
        self.defines = {}

        fh = open(filename, "r")
        while true
            line = fh.readline()
            if line == ""
                break
            end
            line = line[0..-2]
            print(f"Line: {line}")

            if string.startswith(line, "#define ")
                parts = string.split(line, " ", 1)
                define = parts[1]
                while string.startswith(define, " ")
                    define = define[1..-1]
                end

                parts = string.split(define, " ", 1)
                define = parts[0]
                value = parts[1]
                while string.startswith(value, " ")
                    value = value[1..-1]
                end
                self.defines[define] = value
                print(f"  {define} -> {value}")
            end

        end
        fh.close()
    end

    def getdefine(name)
        return self.defines[name]
    end
end


vn = VersionNum("VersionNum")

if vn.getdefine("Module_ComponentName") != "\"berry\""
    os.exit(1)
end
