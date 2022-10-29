//
//  main.cpp
//  CPPTest
//
//  Created by YAWMOO Limited on 29/10/2022.
//  Copyright © 2022 Alessandro Pistocchi. All rights reserved.
//

#include <vector>
#include <stdexcept>
#include <iostream>

class MovingTotal
{
private:
    static size_t binarySearch(std::vector<int> &v, int value)
    {
        size_t size = v.size();
        size_t low = 0, high = size - 1, mid;

        while(high >= low)
        {
            mid = (high + low) / 2;
            if(v[mid] < value)
            {
                low = mid + 1;
            }
            else if(v[mid] > value)
            {
                high = mid - 1;
            }
            else
            {
                return mid;
            }
        }
        return -1;
    }
    
public:
    
    std::vector<int> totals;
    int last_two[2];
    
    void append(const std::vector<int>& list)
    {
        int index_to_use=0;
        size_t totalsSize = totals.size();
        for(size_t i=0;i<list.size();i++) {
            if(totalsSize==0) {
                if(index_to_use==2) {
                    totals.push_back(last_two[0]+last_two[1]+list[i]);
                    last_two[0]=last_two[1];
                    last_two[1]=list[i];
                    totalsSize = 1;
                }
                else {
                    last_two[index_to_use++]=list[i];
                }
            }
            else {
                totals.push_back(last_two[0]+last_two[1]+list[i]);
                last_two[0]=last_two[1];
                last_two[1]=list[i];
            }
        }
    }

    bool contains(int total)
    {
        return binarySearch(totals, total) != -1;
    }
};

int main()
{
    MovingTotal movingTotal;

    std::vector<int> first;
    first.push_back(1);
    first.push_back(2);
    first.push_back(3);
    first.push_back(4);

    movingTotal.append(first);

    std::cout << movingTotal.contains(6) << std::endl;
    std::cout << movingTotal.contains(9) << std::endl;
    std::cout << movingTotal.contains(12) << std::endl;
    std::cout << movingTotal.contains(7) << std::endl;

    std::vector<int> second;
    second.push_back(5);
    movingTotal.append(second);

    std::cout << movingTotal.contains(6) << std::endl;
    std::cout << movingTotal.contains(9) << std::endl;
    std::cout << movingTotal.contains(12) << std::endl;
    std::cout << movingTotal.contains(7) << std::endl;
}
