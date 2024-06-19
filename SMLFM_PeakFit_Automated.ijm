
   dir = "H:/Olivia_PhDThesis/Chapter4_Development/2024_06_18_Precision/"
   setBatchMode(true);
   count = 0;
   countFiles(dir);
   n = 0;
   processFiles(dir);
   //print(count+" files processed");
   
   function countFiles(dir) {
      list = getFileList(dir);
      for (i=0; i<list.length; i++) {
          if (endsWith(list[i], "/"))
              countFiles(""+dir+list[i]);
          else
              count++;
      }
  }

   function processFiles(dir) {
      list = getFileList(dir);
      for (i=0; i<list.length; i++) {
          if (endsWith(list[i], "/"))
              processFiles(""+dir+list[i]);
          else {
             showProgress(n++, count);
             path = dir+list[i];
             processFile(path);
          }
      }
  }

  function processFile(path) {
       if (endsWith(path, ".tif")) {
           open(path);
           fileDir = substring(path, 0, lastIndexOf(path, "/"));
           run("Peak Fit", "origin_x=159 origin_y=832 template=[None] camera_type=sCMOS calibration=131 exposure_time=30 psf=[Circular Gaussian 2D] spot_filter_type=Single spot_filter=Mean smoothing=0.20 search_width=0.40 border_width=0.60 fitting_width=3 fit_solver=[LVM LSE] fail_limit=3 pass_rate=0.50 neighbour_height=0.94 residuals_threshold=0.96 duplicate_distance=0.40 shift_factor=0.98 signal_strength=2 min_photons=100 min_width_factor=0.30 max_width_factor=1.20 precision=80 show_results_table image=[Localisations (width=precision)] results_format=Text results_directory=[" + fileDir + "] camera_model_name=Kinetix22 psf_parameter_1=3.700 fixed smoothing_absolute relative_threshold=1.0E-6 absolute_threshold=1.0E-16 parameter_relative_threshold=0.0 parameter_absolute_threshold=0.0 max_iterations=20 lambda=10.0000 duplicate_distance_absolute precision_method=[Poisson CRLB] table_distance_unit=[pixel (px)] table_intensity_unit=photon table_angle_unit=[degree (°)] table_show_precision table_precision=0 image_size_mode=Scaled image_scale=10 image_size=0 image_pixel_size=5 lut=Red-Hot file_distance_unit=[pixel (px)] file_intensity_unit=photon file_angle_unit=[degree (°)] file_show_precision origin_x=159 origin_y=832");
		   run("Close All");
      }
  }