;; Auto-generated. Do not edit!


(when (boundp 'system_ctrl::algo_status)
  (if (not (find-package "SYSTEM_CTRL"))
    (make-package "SYSTEM_CTRL"))
  (shadow 'algo_status (find-package "SYSTEM_CTRL")))
(unless (find-package "SYSTEM_CTRL::ALGO_STATUS")
  (make-package "SYSTEM_CTRL::ALGO_STATUS"))

(in-package "ROS")
;;//! \htmlinclude algo_status.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass system_ctrl::algo_status
  :super ros::object
  :slots (_header _algo_status ))

(defmethod system_ctrl::algo_status
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:algo_status __algo_status) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _algo_status (string __algo_status))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:algo_status
   (&optional __algo_status)
   (if __algo_status (setq _algo_status __algo_status)) _algo_status)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _algo_status
    4 (length _algo_status)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _algo_status
       (write-long (length _algo_status) s) (princ _algo_status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _algo_status
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _algo_status (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get system_ctrl::algo_status :md5sum-) "ea3cca9ddd69cc9250ffcf7d901d6d13")
(setf (get system_ctrl::algo_status :datatype-) "system_ctrl/algo_status")
(setf (get system_ctrl::algo_status :definition-)
      "Header header
string algo_status
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



(provide :system_ctrl/algo_status "ea3cca9ddd69cc9250ffcf7d901d6d13")


