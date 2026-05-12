
export CUDA_PATH=/usr/local/cuda-12.1
export CUDA_ARCH=89

cmake CMakeLists.txt \
    -DLIBMIN_ROOT=../libmin \
    -DCMAKE_BUILD_TYPE=Release \
    -Bbuild \
    -DBUILD_CUDA=true \
    -DBUILD_OPENGL=true \
    -DBUILD_GLEW=true

make -Cbuild
