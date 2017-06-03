# This is a utility script that is system-specific for my MacOS in order to set up the caffe build so it will be found during an `import caffe`. I use this whenever I rebuild caffe.
# Depending on your setup it may be unnecessary or may require changes.

# Get rid of the existing caffe python package
rm -r ~/Library/Python/2.7/lib/python/site-packages/caffe

# Copy the built package to python's folder for packages
cp -r caffe/distribute/python/caffe ~/Library/Python/2.7/lib/python/site-packages/

# Copy the .so library from the caffe build to be with the python package
cp caffe/distribute/lib/libcaffe.so.1.0.0-rc3 ~/Library/Python/2.7/lib/python/site-packages/caffe/libcaffe.so.1.0.0-rc3

# Fix the relative paths to the .so library
install_name_tool -change @rpath/libcaffe.so.1.0.0-rc3 ~/Library/Python/2.7/lib/python/site-packages/caffe/libcaffe.so.1.0.0-rc3 ~/Library/Python/2.7/lib/python/site-packages/caffe/_caffe.so

# Test that it works
python -c "import caffe"
