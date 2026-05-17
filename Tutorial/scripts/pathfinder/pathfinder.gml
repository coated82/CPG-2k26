function pathfinder()
{
    switch(room)
    {
        case rm_MainGame:
            return choose(pth_Bottom, pth_Top);

        case rm_MainGame_1:
            return pth_Loop;
    }

    return -1;
}