#include "functions.hpp"

#include <QtGlobal>

#include <limits>

namespace cutehmi {
namespace modbus {

uint16_t intToUint16(int value)
{
	// Note: int is guranteed to be at least 16 bits wide by a standard.

	// A bit paranoic, but int can be either one's or two's complement (http://en.cppreference.com/w/cpp/language/types).
	// Since one's complement machines are probably non-existent, just assert that machine is two's complement.
	// On one's complement machines ~0 == -0, on two's complement machines ~0 == -1.
	Q_ASSERT_X(-1 == ~0, __func__, "only two's complement machines are supported by this function");

	// Check if value can be stored in 16 bits.
	Q_ASSERT_X(value <= std::numeric_limits<int16_t>::max(), __func__, "value is below a limit of 16 bit storage");
	Q_ASSERT_X(value >= std::numeric_limits<int16_t>::min(), __func__, "value is over a limit of 16 bit storage");

	// Conversion from signed to unsigned type is well defined by a standard.
	// "If the destination type is unsigned, the resulting value is the smallest unsigned value equal to the source value modulo 2^n
	//  where n is the number of bits used to represent the destination type. That is, depending on whether the destination type is
	//  wider or narrower, signed integers are sign-extended[footnote 1] or truncated and unsigned integers are zero-extended or
	//  truncated respectively." -- http://en.cppreference.com/w/cpp/language/implicit_cast

	return value;
}

int intFromUint16(uint16_t value)
{
	// Note: int is guranteed to be at least 16 bits wide by a standard.

	// A bit paranoic, but int can be either one's or two's complement (http://en.cppreference.com/w/cpp/language/types).
	// Since one's complement machines are probably non-existent, just assert that machine is two's complement.
	// On one's complement machines ~0 == -0, on two's complement machines ~0 == -1.
	Q_ASSERT_X(-1 == ~0, __func__, "only two's complement machines are supported by this function");

	// Conversion from unsigned to signed type is well-defined if value can be represented in destination int.
	// "If the destination type is signed, the value does not change if the source integer can be represented in the destination type.
	//  Otherwise the result is implementation-defined. (Note that this is different from signed integer arithmetic overflow, which
	//  is undefined)." -- http://en.cppreference.com/w/cpp/language/implicit_cast
	// Anyways, we need to make reverse of intToUint16(), not represent value directly.

	if (value > std::numeric_limits<int16_t>::max())
		return -(std::numeric_limits<uint16_t>::max() - value + 1);
	else
		return value;
}

}
}
