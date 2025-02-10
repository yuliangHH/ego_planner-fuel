// Auto-generated. Do not edit!

// (in-package system_ctrl.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class viobot_ctrl {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.image_select = null;
      this.imu_raw = null;
      this.tof_enable = null;
      this.tof_depth = null;
      this.tof_amp = null;
      this.light = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('image_select')) {
        this.image_select = initObj.image_select
      }
      else {
        this.image_select = 0;
      }
      if (initObj.hasOwnProperty('imu_raw')) {
        this.imu_raw = initObj.imu_raw
      }
      else {
        this.imu_raw = false;
      }
      if (initObj.hasOwnProperty('tof_enable')) {
        this.tof_enable = initObj.tof_enable
      }
      else {
        this.tof_enable = false;
      }
      if (initObj.hasOwnProperty('tof_depth')) {
        this.tof_depth = initObj.tof_depth
      }
      else {
        this.tof_depth = false;
      }
      if (initObj.hasOwnProperty('tof_amp')) {
        this.tof_amp = initObj.tof_amp
      }
      else {
        this.tof_amp = false;
      }
      if (initObj.hasOwnProperty('light')) {
        this.light = initObj.light
      }
      else {
        this.light = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type viobot_ctrl
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [image_select]
    bufferOffset = _serializer.int32(obj.image_select, buffer, bufferOffset);
    // Serialize message field [imu_raw]
    bufferOffset = _serializer.bool(obj.imu_raw, buffer, bufferOffset);
    // Serialize message field [tof_enable]
    bufferOffset = _serializer.bool(obj.tof_enable, buffer, bufferOffset);
    // Serialize message field [tof_depth]
    bufferOffset = _serializer.bool(obj.tof_depth, buffer, bufferOffset);
    // Serialize message field [tof_amp]
    bufferOffset = _serializer.bool(obj.tof_amp, buffer, bufferOffset);
    // Serialize message field [light]
    bufferOffset = _serializer.bool(obj.light, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type viobot_ctrl
    let len;
    let data = new viobot_ctrl(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [image_select]
    data.image_select = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [imu_raw]
    data.imu_raw = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [tof_enable]
    data.tof_enable = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [tof_depth]
    data.tof_depth = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [tof_amp]
    data.tof_amp = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [light]
    data.light = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'system_ctrl/viobot_ctrl';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '169118a6b7255df21a4b81f2f4a87a03';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new viobot_ctrl(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.image_select !== undefined) {
      resolved.image_select = msg.image_select;
    }
    else {
      resolved.image_select = 0
    }

    if (msg.imu_raw !== undefined) {
      resolved.imu_raw = msg.imu_raw;
    }
    else {
      resolved.imu_raw = false
    }

    if (msg.tof_enable !== undefined) {
      resolved.tof_enable = msg.tof_enable;
    }
    else {
      resolved.tof_enable = false
    }

    if (msg.tof_depth !== undefined) {
      resolved.tof_depth = msg.tof_depth;
    }
    else {
      resolved.tof_depth = false
    }

    if (msg.tof_amp !== undefined) {
      resolved.tof_amp = msg.tof_amp;
    }
    else {
      resolved.tof_amp = false
    }

    if (msg.light !== undefined) {
      resolved.light = msg.light;
    }
    else {
      resolved.light = false
    }

    return resolved;
    }
};

module.exports = viobot_ctrl;
