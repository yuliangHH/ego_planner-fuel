; Auto-generated. Do not edit!


(cl:in-package system_ctrl-msg)


;//! \htmlinclude viobot_ctrl.msg.html

(cl:defclass <viobot_ctrl> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (image_select
    :reader image_select
    :initarg :image_select
    :type cl:integer
    :initform 0)
   (imu_raw
    :reader imu_raw
    :initarg :imu_raw
    :type cl:boolean
    :initform cl:nil)
   (tof_enable
    :reader tof_enable
    :initarg :tof_enable
    :type cl:boolean
    :initform cl:nil)
   (tof_depth
    :reader tof_depth
    :initarg :tof_depth
    :type cl:boolean
    :initform cl:nil)
   (tof_amp
    :reader tof_amp
    :initarg :tof_amp
    :type cl:boolean
    :initform cl:nil)
   (light
    :reader light
    :initarg :light
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass viobot_ctrl (<viobot_ctrl>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <viobot_ctrl>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'viobot_ctrl)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name system_ctrl-msg:<viobot_ctrl> is deprecated: use system_ctrl-msg:viobot_ctrl instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <viobot_ctrl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader system_ctrl-msg:header-val is deprecated.  Use system_ctrl-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'image_select-val :lambda-list '(m))
(cl:defmethod image_select-val ((m <viobot_ctrl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader system_ctrl-msg:image_select-val is deprecated.  Use system_ctrl-msg:image_select instead.")
  (image_select m))

(cl:ensure-generic-function 'imu_raw-val :lambda-list '(m))
(cl:defmethod imu_raw-val ((m <viobot_ctrl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader system_ctrl-msg:imu_raw-val is deprecated.  Use system_ctrl-msg:imu_raw instead.")
  (imu_raw m))

(cl:ensure-generic-function 'tof_enable-val :lambda-list '(m))
(cl:defmethod tof_enable-val ((m <viobot_ctrl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader system_ctrl-msg:tof_enable-val is deprecated.  Use system_ctrl-msg:tof_enable instead.")
  (tof_enable m))

(cl:ensure-generic-function 'tof_depth-val :lambda-list '(m))
(cl:defmethod tof_depth-val ((m <viobot_ctrl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader system_ctrl-msg:tof_depth-val is deprecated.  Use system_ctrl-msg:tof_depth instead.")
  (tof_depth m))

(cl:ensure-generic-function 'tof_amp-val :lambda-list '(m))
(cl:defmethod tof_amp-val ((m <viobot_ctrl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader system_ctrl-msg:tof_amp-val is deprecated.  Use system_ctrl-msg:tof_amp instead.")
  (tof_amp m))

(cl:ensure-generic-function 'light-val :lambda-list '(m))
(cl:defmethod light-val ((m <viobot_ctrl>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader system_ctrl-msg:light-val is deprecated.  Use system_ctrl-msg:light instead.")
  (light m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <viobot_ctrl>) ostream)
  "Serializes a message object of type '<viobot_ctrl>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'image_select)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'imu_raw) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'tof_enable) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'tof_depth) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'tof_amp) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'light) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <viobot_ctrl>) istream)
  "Deserializes a message object of type '<viobot_ctrl>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'image_select) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:slot-value msg 'imu_raw) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'tof_enable) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'tof_depth) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'tof_amp) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'light) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<viobot_ctrl>)))
  "Returns string type for a message object of type '<viobot_ctrl>"
  "system_ctrl/viobot_ctrl")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'viobot_ctrl)))
  "Returns string type for a message object of type 'viobot_ctrl"
  "system_ctrl/viobot_ctrl")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<viobot_ctrl>)))
  "Returns md5sum for a message object of type '<viobot_ctrl>"
  "169118a6b7255df21a4b81f2f4a87a03")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'viobot_ctrl)))
  "Returns md5sum for a message object of type 'viobot_ctrl"
  "169118a6b7255df21a4b81f2f4a87a03")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<viobot_ctrl>)))
  "Returns full string definition for message of type '<viobot_ctrl>"
  (cl:format cl:nil "Header header~%int32 image_select~%bool imu_raw~%bool tof_enable~%bool tof_depth~%bool tof_amp~%bool light~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'viobot_ctrl)))
  "Returns full string definition for message of type 'viobot_ctrl"
  (cl:format cl:nil "Header header~%int32 image_select~%bool imu_raw~%bool tof_enable~%bool tof_depth~%bool tof_amp~%bool light~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <viobot_ctrl>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <viobot_ctrl>))
  "Converts a ROS message object to a list"
  (cl:list 'viobot_ctrl
    (cl:cons ':header (header msg))
    (cl:cons ':image_select (image_select msg))
    (cl:cons ':imu_raw (imu_raw msg))
    (cl:cons ':tof_enable (tof_enable msg))
    (cl:cons ':tof_depth (tof_depth msg))
    (cl:cons ':tof_amp (tof_amp msg))
    (cl:cons ':light (light msg))
))
