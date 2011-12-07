function [ i ] = ipresizebl( i, sx, sy)
%IPRESIZEBL Zooming by bilineair interpolation
%       Capable of zooming and shrinking an image by bi-linear
%       interpolation. The input to the function are the scaling 
%       factors in the x- and y-dimensions, where x = y = 1.0 
%       represents no scaling.

A  = im2double(i);    % convert image to double with domain [0,1]
sr = size(A,1);       % source number of rows
sc = size(A,2);       % source number of columns

tr = floor(sr * sy);  % target image number of rows  
tc = floor(sc * sx);  % target image number of columns

ratio_x = sc / tc;    % spread of pixels in x direction
ratio_y = sr / tr;    % spread of pixels in y direction

% starting at (1,1) we distribute A over B and interpolate intermediate
% pixels using weighted bilineair interpolation. 

    % TODO: http://tech-algorithm.com/articles/bilinear-image-scaling/
    % create target image B
    B = zeros(tr,tc);
    
    % Loop. If (x,y) not at a source pixel, then interpolate
    for x = 1:1:tr
        for y = 1:1:tc
            
            % find nearest (sx,sy)
            sx = round(ratio_x * x);
            sy = round(ratio_y * y);
            
            % find distance between (sx,sy) and (x,y)
            dx = (ratio_x * x) - sx;
            dy = (ratio_y * y) - sy;

            % find surrounding 4 pixels based on dx,dy
            tl = A(,);
            tr = A(,);
            bl = A(,);
            br = A(,);
        end
    end
    
i = im2uint8(B);                        % convert to 8-bit

end