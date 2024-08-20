bool checkExamType(String text) {
  if (text.toLowerCase().contains('regular') ||
      text.toLowerCase().contains('back') ||
      text.toLowerCase().contains('examination')) {
    return true;
  }
  return false;
}

bool checkName(String text) {
  if (text.toLowerCase().contains('name')) {
    return true;
  }
  return false;
}

bool checkCampus(String text) {
  if (text.toLowerCase().contains('campus')) {
    return true;
  }
  return false;
}

bool checkRoll(String text) {
  if (text.toLowerCase().contains('roll')) {
    return true;
  }
  return false;
}

bool checkPart(String text) {
  if (text.toLowerCase().contains('part')) {
    return true;
  }
  return false;
}

bool checkDate(String text) {
  if (text.toLowerCase().contains('date:-')) {
    return true;
  }
  return false;
}

bool checkGrandTotal(String text) {
  if (text.toLowerCase().contains('grand total')) {
    return true;
  }
  return false;
}

bool checkResult(String text) {
  if (text.toLowerCase().contains('result')) {
    return true;
  }
  return false;
}

bool checkSubjectCode(String text) {
  if (text.startsWith('ME') ||
      text.startsWith('CE') ||
      text.startsWith('EX') ||
      text.startsWith('EE') ||
      text.startsWith('CT') ||
      text.startsWith('SH')) {
    return true;
  }
  return false;
}

bool checkSubjects(String text) {
  if (text.toLowerCase().contains('basic') ||
      text.toLowerCase().contains('basie') ||
      text.toLowerCase().contains('electronies') ||
      text.toLowerCase().contains('practical') ||
      text.toLowerCase().contains('thermodynamies') ||
      text.toLowerCase().contains('fundamental') ||
      text.toLowerCase().contains('mathematics') ||
      text.toLowerCase().contains('applied') ||
      text.toLowerCase().contains('mechanics') ||
      text.toLowerCase().contains('drawing') ||
      text.toLowerCase().contains('programming') ||
      text.toLowerCase().contains('architecture') ||
      text.toLowerCase().contains('embedded') ||
      text.toLowerCase().contains('signal') ||
      text.toLowerCase().contains('artificial') ||
      text.toLowerCase().contains('project') ||
      text.toLowerCase().contains('management') ||
      text.toLowerCase().contains('economics') ||
      text.toLowerCase().contains('english') ||
      text.toLowerCase().contains('logic') ||
      text.toLowerCase().contains('microprocessor') ||
      text.toLowerCase().contains('society') ||
      text.toLowerCase().contains('database') ||
      text.toLowerCase().contains('software') ||
      text.toLowerCase().contains('network') ||
      text.toLowerCase().contains('physics') ||
      text.toLowerCase().contains('chemistry') ||
      text.toLowerCase().contains('c++') ||
      text.toLowerCase().contains('technology')) {
    return true;
  }
  return false;
}

bool checkCRN(String text) {
  if (text.contains('/BC') || text.contains('/BE') || text.contains('/BM')) {
    return true;
  }
  return false;
}

bool checkProgram(String text) {
  if (text.toLowerCase().contains('computer eng') ||
      text.toLowerCase().contains('civil eng') ||
      (text.toLowerCase().contains('electrical eng') &&
          !text.toLowerCase().contains('basic electrical eng')) ||
      text.toLowerCase().contains('mechanical eng') ||
      (text.toLowerCase().contains('electronics eng') &&
          !text.toLowerCase().contains('basic electronics eng'))) {
    return true;
  }
  return false;
}

bool checkLevel(String text) {
  if (text.toLowerCase().contains('bachel') ||
      text.toLowerCase().contains('maste')) {
    return true;
  }
  return false;
}
