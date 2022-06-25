/*
 * sha.hpp
 *
 *  Created on: 25 Jun 2022
 *      Author: abhim
 */
#include<type_traits>

#include"mbedtls/sha256.h"
#include"mbedtls/sha512.h"

#ifndef APPLICATION_USER_SHA_HPP_
#define APPLICATION_USER_SHA_HPP_

struct SHA256{};
struct SHA512{};

//primary template
template<typename T>
class SHA{};

template<>
class SHA<SHA256>
{
public:
	SHA()
	{
		mbedtls_sha256_init(&ctx);
		mbedtls_sha256_starts_ret(&ctx, 0);
	};

	~SHA()
	{
		mbedtls_sha256_free(&ctx);
	}

	void update(const unsigned char *input, size_t ilen)
	{
		//ignore return type for now
		(void)mbedtls_sha256_update_ret(&ctx, input, ilen);
	};

	void finish(unsigned char* output)
	{
		//ignore return type for now
		(void)mbedtls_sha256_finish_ret(&ctx, output);
	};

private:
	mbedtls_sha256_context ctx;
};

template<>
class SHA<SHA512>
{
public:
	SHA()
	 {
		mbedtls_sha512_init(&ctx);
		mbedtls_sha512_starts_ret(&ctx, 0);
	 };

	void update(const unsigned char *input, size_t ilen)
	{
		//ignore return type for now
		(void)mbedtls_sha512_update_ret(&ctx, input, ilen);
	};

	void finish(unsigned char output[32])
	{
		//ignore return type for now
		(void)mbedtls_sha512_finish_ret(&ctx, &output[0]);
	};

private:
	mbedtls_sha512_context ctx;
};

#endif /* APPLICATION_USER_SHA_HPP_ */
