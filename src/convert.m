function imgOut = convert(imgIn, imgRef)
    % Make the input image to the grayscale
    imgIn = im2gray(imgIn);

    if ~isequal(size(imgIn), size(imgRef(:, :, 1)))
        % Resize imgRef
        imgRef = imresize(imgRef, size(imgIn));
    end

    I1 = histogram_specification(imgIn, imgRef(:, :, 1));
    I2 = histogram_specification(imgIn, imgRef(:, :, 2));
    I3 = histogram_specification(imgIn, imgRef(:, :, 3));

    imgOut = zeros(size(imgIn, 1), size(imgIn, 2), 3, 'uint8');

    imgOut(:, :, 1) = I1;
    imgOut(:, :, 2) = I2;
    imgOut(:, :, 3) = I3;

    figure, imshow(imgIn), title('imgIn');
    figure, imshow(imgRef), title('imgRef');
    figure, imshow(imgOut), title('imgOut');

end
