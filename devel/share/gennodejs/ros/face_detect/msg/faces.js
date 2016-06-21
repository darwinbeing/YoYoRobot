// Auto-generated. Do not edit!

// (in-package face_detect.msg)


"use strict";

let _serializer = require('../base_serialize.js');
let _deserializer = require('../base_deserialize.js');
let _finder = require('../find.js');
let facebox = require('./facebox.js');

//-----------------------------------------------------------

class faces {
  constructor() {
    this.face_boxes = [];
    this.image_width = 0;
    this.image_height = 0;
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type faces
    // Serialize the length for message field [face_boxes]
    bufferInfo = _serializer.uint32(obj.face_boxes.length, bufferInfo);
    // Serialize message field [face_boxes]
    obj.face_boxes.forEach((val) => {
      bufferInfo = facebox.serialize(val, bufferInfo);
    });
    // Serialize message field [image_width]
    bufferInfo = _serializer.uint16(obj.image_width, bufferInfo);
    // Serialize message field [image_height]
    bufferInfo = _serializer.uint16(obj.image_height, bufferInfo);
    return bufferInfo;
  }

  static deserialize(buffer) {
    //deserializes a message object of type faces
    let tmp;
    let len;
    let data = new faces();
    // Deserialize array length for message field [face_boxes]
    tmp = _deserializer.uint32(buffer);
    len = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [face_boxes]
    data.face_boxes = new Array(len);
    for (let i = 0; i < len; ++i) {
      tmp = facebox.deserialize(buffer);
      data.face_boxes[i] = tmp.data;
      buffer = tmp.buffer;
    }
    // Deserialize message field [image_width]
    tmp = _deserializer.uint16(buffer);
    data.image_width = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [image_height]
    tmp = _deserializer.uint16(buffer);
    data.image_height = tmp.data;
    buffer = tmp.buffer;
    return {
      data: data,
      buffer: buffer
    }
  }

  static datatype() {
    // Returns string type for a message object
    return 'face_detect/faces';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0a7567e15b2cf367464a82218fea65a8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    facebox[] face_boxes
    uint16 image_width
    uint16 image_height
    
    ================================================================================
    MSG: face_detect/facebox
    uint16 top
    uint16 left
    uint16 width
    uint16 height
    
    `;
  }

};

module.exports = faces;
