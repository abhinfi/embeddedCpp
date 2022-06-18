#include "aes_process.hpp"
//max key size of 256bit
unsigned char key[32] = {'m','y','k','e','y','e','n','c','m','y','k','e','y','e','n','c',1,2,3,4,5,6,7,8};

uint8_t AesHandle::encrypt(const unsigned char* input, unsigned char* output)
{
    //IV 128bits
    unsigned char IV[16] = {1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8};
    mbedtls_aes_context enaes_ctx;
    //Initialization
    mbedtls_aes_init( &enaes_ctx );
    //binding of key
    if(!mbedtls_aes_setkey_enc(&enaes_ctx, key, 256))
    {
        //encryption
        if(mbedtls_aes_crypt_cbc(&enaes_ctx, MBEDTLS_AES_ENCRYPT, 16, IV, input, output))
        {
            return 1;
        }
    }
    return 0;
}

uint8_t AesHandle::decrypt(const unsigned char* input, unsigned char* output)
{
    //IV 128bits
    unsigned char IV[16] = {1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8};
    mbedtls_aes_context decaes_ctx;
    //Initialization
    mbedtls_aes_init( &decaes_ctx );
    //key binding
    if(!mbedtls_aes_setkey_dec(&decaes_ctx, key, 256))
    {
        //decryption
        if(mbedtls_aes_crypt_cbc(&decaes_ctx, MBEDTLS_AES_DECRYPT, 16, IV, input, output))
        {
            return 1;
        }
    }
    return 0;
}
