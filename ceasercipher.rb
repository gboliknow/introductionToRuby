def caesar_cipher(string,shift_factor)

    # Split string into character array, get ascii value for each character 
    # 65 - 90 for A-B
    # 97 - 122 for a-b
    asciis = string.split("").map { |e| e.ord }

    shifted = asciis.map do |ascii|
        # check if character is aplhabetic, yes - do shift , no - no shift
        if ascii.between?(65,90)
            # logic for wrap around
            if shift_factor.positive?
                ascii + shift_factor > 90 ? (ascii + shift_factor) - 26 : ascii + shift_factor
            else
                ascii + shift_factor < 65 ? (ascii + shift_factor) + 26 : ascii + shift_factor
            end
        elsif ascii.between?(97,122)
            if shift_factor.positive?
                ascii + shift_factor > 122 ? (ascii + shift_factor) - 26 : ascii + shift_factor
            else
                ascii + shift_factor < 97 ? (ascii + shift_factor) + 26 : ascii + shift_factor
            end
        else
            ascii
        end
    end

    shifted_string = shifted.map! { |a| a.chr }.join
    p shifted_string
end
class CaesarCipher
    def translate(message, shift, result = '')
      message.each_char do |char|
        base = char.ord < 91 ? 65 : 97
        # Modifies Lowercase & Uppercase
        if char.ord.between?(65, 90) || char.ord.between?(97, 122)
          rotation = (((char.ord - base) + shift) % 26) + base
          result += rotation.chr
        # Keeps spaces & punctuation
        else
          result += char
        end
      end
      result
    end
  end
print "Enter the string to encode : "
string = gets.chomp

print "Enter the shift factor for the string : "
shift_factor = gets.chomp.to_i

caesar_cipher(string,shift_factor)
translate(string, shift_factor, result = '')