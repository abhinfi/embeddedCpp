/*
 * noncopyable.hpp
 *
 *  Created on: Feb 27, 2021
 *      Author: ab
 */
namespace util
{
    class noncopyable
    {
        protected:
            noncopyable()=default;
            ~noncopyable()=default;
        private:
            noncopyable(const noncopyable&) = delete;
            noncopyable& operator=(const noncopyable) = delete;
    };
}



