#include "mbedtls/aes.h"

class AesHandle
{
public:
    static uint8_t encrypt(const unsigned char* input, unsigned char* output);
    static uint8_t decrypt(const unsigned char* input, unsigned char* output);

};
