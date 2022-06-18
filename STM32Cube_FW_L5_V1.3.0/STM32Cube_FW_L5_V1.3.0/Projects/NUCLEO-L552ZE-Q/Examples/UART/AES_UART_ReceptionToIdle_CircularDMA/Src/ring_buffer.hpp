/*
 * ring_buffer.hpp
 *
 *  Created on: Jan 10, 2021
 *      Author: ab
 */

#ifndef RING_BUFFER_HPP_
#define RING_BUFFER_HPP_

#include <type_traits>
#include "noncopyable.hpp"

//configure data type for size variables
using var_type = uint16_t;

template <typename T, const var_type size>
class RingBuffer final: private util::noncopyable
{
private:
    //types
    using value_type = T;

    //variables
    value_type buffer[size];
    const var_type buffer_size{size};
    var_type head{0};
    var_type tail{0};
    bool is_full{true};

public:
    explicit RingBuffer(void)
    {
        static_assert(size > 1 && "size must be grater than 1");
        head    = tail;
        is_full = false;
    }

    void put(value_type item)
    {
        buffer[head] = item;
        //careful if buffer is already full
        if(is_full)
        {
            //current value pointed by tail is latest one, increment it to point oldest value
            tail = (tail + 1u) % buffer_size;
        }
        head = (head + 1u) % buffer_size;
        //evaluate here if buffer is full
        if(head == tail)
        {
            is_full = true;
        }
    }

    value_type get(void)
    {
        if(isEmpty())
        {
            return 0;
        }

        value_type val = buffer[tail];
        is_full = false;
        tail = (tail + 1u) % buffer_size;
        return val;
    }

    void reset(void)
    {
        head    = tail;
        is_full = false;
    }

    bool isEmpty(void) const
    {
        return (!is_full && (head == tail));
    }

    bool isFull(void) const
    {
        return is_full;
    }

    var_type length(void) const
    {
        var_type buffer_length = 0u;
        if(is_full)
        {
            buffer_length = buffer_size;
        }
        else
        {
            if(head >= tail)
            {
                buffer_length = head - tail;
            }
            else
            {
                buffer_length = buffer_size + head - tail;
            }
        }
        return buffer_length;
    }

    var_type capacity(void) const
    {
        return buffer_size;
    }
};



#endif /* RING_BUFFER_HPP_ */
