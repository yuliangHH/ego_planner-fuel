;; Auto-generated. Do not edit!


(when (boundp 'sensor_pub::ImageInfo)
  (if (not (find-package "SENSOR_PUB"))
    (make-package "SENSOR_PUB"))
  (shadow 'ImageInfo (find-package "SENSOR_PUB")))
(unless (find-package "SENSOR_PUB::IMAGEINFO")
  (make-package "SENSOR_PUB::IMAGEINFO"))

(in-package "ROS")
;;//! \htmlinclude ImageInfo.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass sensor_pub::ImageInfo
  :super ros::object
  :slots (_header _exposure _analog_gain _digital_gain ))

(defmethod sensor_pub::ImageInfo
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:exposure __exposure) 0)
    ((:analog_gain __analog_gain) 0.0)
    ((:digital_gain __digital_gain) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _exposure (round __exposure))
   (setq _analog_gain (float __analog_gain))
   (setq _digital_gain (float __digital_gain))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:exposure
   (&optional __exposure)
   (if __exposure (setq _exposure __exposure)) _exposure)
  (:analog_gain
   (&optional __analog_gain)
   (if __analog_gain (setq _analog_gain __analog_gain)) _analog_gain)
  (:digital_gain
   (&optional __digital_gain)
   (if __digital_gain (setq _digital_gain __digital_gain)) _digital_gain)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint32 _exposure
    4
    ;; float32 _analog_gain
    4
    ;; float32 _digital_gain
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint32 _exposure
       (write-long _exposure s)
     ;; float32 _analog_gain
       (sys::poke _analog_gain (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _digital_gain
       (sys::poke _digital_gain (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint32 _exposure
     (setq _exposure (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _analog_gain
     (setq _analog_gain (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _digital_gain
     (setq _digital_gain (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get sensor_pub::ImageInfo :md5sum-) "26da7a856946892d3a235072866504a8")
(setf (get sensor_pub::ImageInfo :datatype-) "sensor_pub/ImageInfo")
(setf (get sensor_pub::ImageInfo :definition-)
      "Header header
uint32 exposure
float32 analog_gain
float32 digital_gain
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :sensor_pub/ImageInfo "26da7a856946892d3a235072866504a8")


