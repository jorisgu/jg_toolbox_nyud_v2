function showable = showIt(x, toshow)
x_v = x(:);
max_x = single(max(x_v));
%min_x = min(x_v);
x_single = 255.0 / max_x * ( single(x) );
showable = uint8(x_single);
if toshow
    imshow(showable);
end
end