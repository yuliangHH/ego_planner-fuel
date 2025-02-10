;; Auto-generated. Do not edit!


(when (boundp 'system_ctrl::viobot_ctrl)
  (if (not (find-package "SYSTEM_CTRL"))
    (make-package "SYSTEM_CTRL"))
  (shadow 'viobot_ctrl (find-package "SYSTEM_CTRL")))
(unless (find-package "SYSTEM_CTRL::VIOBOT_CTRL")
  (make-package "SYSTEM_CTRL::VIOBOT_CTRL"))

(in-package "ROS")
;;//! \htmlinclude viobot_ctrl.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass system_ctrl::viobot_ctrl
  :super ros::object
  :slots (_header _image_select _imu_raw _tof_enable _tof_depth _tof_amp _light ))

(defmethod system_ctrl::viobot_ctrl
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:image_select __image_select) 0)
    ((:imu_raw __imu_raw) nil)
    ((:tof_enable __tof_enable) nil)
    ((:tof_depth __tof_depth) nil)
    ((:tof_amp __tof_amp) nil)
    ((:light __light) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _image_select (round __image_select))
   (setq _imu_raw __imu_raw)
   (setq _tof_enable __tof_enable)
   (setq _tof_depth __tof_depth)
   (setq _tof_amp __tof_amp)
   (setq _light __light)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:image_select
   (&optional __image_select)
   (if __image_select (setq _image_select __image_select)) _image_select)
  (:imu_raw
   (&optional __imu_raw)
   (if __imu_raw (setq _imu_raw __imu_raw)) _imu_raw)
  (:tof_enable
   (&optional __tof_enable)
   (if __tof_enable (setq _tof_enable __tof_enable)) _tof_enable)
  (:tof_depth
   (&optional __tof_depth)
   (if __tof_depth (setq _tof_depth __tof_depth)) _tof_depth)
  (:tof_amp
   (&optional __tof_amp)
   (if __tof_amp (setq _tof_amp __tof_amp)) _tof_amp)
  (:light
   (&optional __light)
   (if __light (setq _light __light)) _light)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _image_select
    4
    ;; bool _imu_raw
    1
    ;; bool _tof_enable
    1
    ;; bool _tof_depth
    1
    ;; bool _tof_amp
    1
    ;; bool _light
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _image_select
       (write-long _image_select s)
     ;; bool _imu_raw
       (if _imu_raw (write-byte -1 s) (write-byte 0 s))
     ;; bool _tof_enable
       (if _tof_enable (write-byte -1 s) (write-byte 0 s))
     ;; bool _tof_depth
       (if _tof_depth (write-byte -1 s) (write-byte 0 s))
     ;; bool _tof_amp
       (if _tof_amp (write-byte -1 s) (write-byte 0 s))
     ;; bool _light
       (if _light (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _image_select
     (setq _image_select (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _imu_raw
     (setq _imu_raw (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _tof_enable
     (setq _tof_enable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _tof_depth
     (setq _tof_depth (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _tof_amp
     (setq _tof_amp (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _light
     (setq _light (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get system_ctrl::viobot_ctrl :md5sum-) "169118a6b7255df21a4b81f2f4a87a03")
(setf (get system_ctrl::viobot_ctrl :datatype-) "system_ctrl/viobot_ctrl")
(setf (get system_ctrl::viobot_ctrl :definition-)
      "Header header
int32 image_select
bool imu_raw
bool tof_enable
bool tof_depth
bool tof_amp
bool light
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



(provide :system_ctrl/viobot_ctrl "169118a6b7255df21a4b81f2f4a87a03")


