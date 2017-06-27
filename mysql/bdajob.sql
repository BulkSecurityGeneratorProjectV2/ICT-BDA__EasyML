/*
Navicat MySQL Data Transfer

Source Server         : 10.20.13.7
Source Server Version : 50717
Source Host           : 10.20.13.7:3306
Source Database       : studio

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-05-01 22:45:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bdajob
-- ----------------------------
DROP TABLE IF EXISTS `bdajob`;
CREATE TABLE `bdajob` (
  `job_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `job_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `graphxml` text CHARACTER SET utf8,
  `account` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `last_submit_time` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `endtime` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `is_example` tinyint(5) DEFAULT '0',
  `oozie_job` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bdajob
-- ----------------------------
INSERT INTO `bdajob` VALUES ('05010808093800000-bda', 'Examples of distributed abalone age prediction', '<graph>\n<widget type=\'dataset\'>\n  <id>DataSet-15bc2ba1b9b-fe1c</id>\n  <moduleId>Dataset</moduleId>\n  <x>454</x>\n  <y>74</y>\n  <file>/EML/Data/Dataset</file>\n</widget>\n<widget type=\'program\'>\n  <id>RMSE-15bc2b909a8-346a</id>\n  <moduleId>RMSE</moduleId>\n  <oozJob>latest</oozJob>\n  <x>352</x>\n  <y>495</y>\n  <work_path>${appPath}/RMSE-15bc2b909a8-346a/</work_path>\n  <cmd_line>spark-submit --class bda.spark.runnable.evaluate.RMSERunner spark.jar --predict_pt ${appPath}/GBRT_Predict-15bc2b9c369-f641/5BE7BEAE-135C-4F48-90C9-21EC291AEF89/5BE7BEAE-135C-4F48-90C9-21EC291AEF89</cmd_line>\n  <is_distributed>true</is_distributed>\n  <is_standalone_script>false</is_standalone_script>\n</widget>\n<widget type=\'program\'>\n  <id>File_split-15bc2b97594-306b</id>\n  <moduleId>File_split</moduleId>\n  <oozJob>latest</oozJob>\n  <x>420</x>\n  <y>219</y>\n  <work_path>${appPath}/File_split-15bc2b97594-306b/</work_path>\n  <file>00008E8E-6BBC-45A6-A7F4-A6C499E2A3A7</file>\n  <file>AD415C51-4BAF-443C-868E-F0B59C744F1B</file>\n  <param>7:0.8</param>\n  <cmd_line>spark-submit --class bda.spark.runnable.preprocess.FileSplitRunner spark.jar --input_pt ${appPath}/LibSVM2LabeledPoint-15bc2b9f8ca-3180/9EF6C361-1D0B-42D6-B0AA-C0CECA9586DC/9EF6C361-1D0B-42D6-B0AA-C0CECA9586DC --ratio 0.8 --output_pt1 ${appPath}/File_split-15bc2b97594-306b/00008E8E-6BBC-45A6-A7F4-A6C499E2A3A7/00008E8E-6BBC-45A6-A7F4-A6C499E2A3A7 --output_pt2 ${appPath}/File_split-15bc2b97594-306b/AD415C51-4BAF-443C-868E-F0B59C744F1B/AD415C51-4BAF-443C-868E-F0B59C744F1B</cmd_line>\n  <is_distributed>true</is_distributed>\n  <is_standalone_script>false</is_standalone_script>\n</widget>\n<widget type=\'program\'>\n  <id>GBRT_Train-15bc2b99d06-b3a7</id>\n  <moduleId>GBRT_Train</moduleId>\n  <oozJob>latest</oozJob>\n  <x>355</x>\n  <y>355</y>\n  <work_path>${appPath}/GBRT_Train-15bc2b99d06-b3a7/</work_path>\n  <file>F0665C46-A1FC-4C9F-BA6D-8C97D571A372</file>\n  <param>11:Variance</param>\n  <param>13:10</param>\n  <param>15:32</param>\n  <param>17:10000</param>\n  <param>19:15</param>\n  <param>21:1e-6</param>\n  <param>23:10</param>\n  <param>25:0.02</param>\n  <cmd_line>spark-submit --class bda.spark.runnable.tree.gbrt.Train spark.jar --train_pt ${appPath}/File_split-15bc2b9d556-f370/13C2F84E-6FBA-46FC-BE81-CD047C15B138/13C2F84E-6FBA-46FC-BE81-CD047C15B138 --model_pt ${appPath}/GBRT_Train-15bc2b99d06-b3a7/F0665C46-A1FC-4C9F-BA6D-8C97D571A372/F0665C46-A1FC-4C9F-BA6D-8C97D571A372 --cp_pt /EML/tmp --impurity \'Variance\' --max_depth 10 --max_bins 32 --bin_samples 10000 --min_node_size 15 --min_info_gain 1e-6 --num_round 10 --learn_rate 0.02</cmd_line>\n  <is_distributed>true</is_distributed>\n  <is_standalone_script>false</is_standalone_script>\n</widget>\n<widget type=\'program\'>\n  <id>GBRT_Predict-15bc2b9c369-f641</id>\n  <moduleId>GBRT_Predict</moduleId>\n  <oozJob>latest</oozJob>\n  <x>347</x>\n  <y>434</y>\n  <work_path>${appPath}/GBRT_Predict-15bc2b9c369-f641/</work_path>\n  <file>5BE7BEAE-135C-4F48-90C9-21EC291AEF89</file>\n  <cmd_line>spark-submit --class bda.spark.runnable.tree.gbrt.Predict spark.jar --model_pt ${appPath}/GBRT_Train-15bc2b99d06-b3a7/F0665C46-A1FC-4C9F-BA6D-8C97D571A372/F0665C46-A1FC-4C9F-BA6D-8C97D571A372 --test_pt ${appPath}/File_split-15bc2b9d556-f370/4537F376-6E1E-4CC5-B8C6-8F8680683767/4537F376-6E1E-4CC5-B8C6-8F8680683767 --predict_pt ${appPath}/GBRT_Predict-15bc2b9c369-f641/5BE7BEAE-135C-4F48-90C9-21EC291AEF89/5BE7BEAE-135C-4F48-90C9-21EC291AEF89</cmd_line>\n  <is_distributed>true</is_distributed>\n  <is_standalone_script>false</is_standalone_script>\n</widget>\n<widget type=\'program\'>\n  <id>GBRT_Predict-15bc2b9b546-d790</id>\n  <moduleId>GBRT_Predict</moduleId>\n  <oozJob>latest</oozJob>\n  <x>531</x>\n  <y>435</y>\n  <work_path>${appPath}/GBRT_Predict-15bc2b9b546-d790/</work_path>\n  <file>9129BB64-6AB1-46F6-8E24-6F8A4A481998</file>\n  <cmd_line>spark-submit --class bda.spark.runnable.tree.gbrt.Predict spark.jar --model_pt ${appPath}/GBRT_Train-15bc2b99d06-b3a7/F0665C46-A1FC-4C9F-BA6D-8C97D571A372/F0665C46-A1FC-4C9F-BA6D-8C97D571A372 --test_pt ${appPath}/File_split-15bc2b97594-306b/AD415C51-4BAF-443C-868E-F0B59C744F1B/AD415C51-4BAF-443C-868E-F0B59C744F1B --predict_pt ${appPath}/GBRT_Predict-15bc2b9b546-d790/9129BB64-6AB1-46F6-8E24-6F8A4A481998/9129BB64-6AB1-46F6-8E24-6F8A4A481998</cmd_line>\n  <is_distributed>true</is_distributed>\n  <is_standalone_script>false</is_standalone_script>\n</widget>\n<widget type=\'program\'>\n  <id>File_split-15bc2b9d556-f370</id>\n  <moduleId>File_split</moduleId>\n  <oozJob>latest</oozJob>\n  <x>401</x>\n  <y>286</y>\n  <work_path>${appPath}/File_split-15bc2b9d556-f370/</work_path>\n  <file>13C2F84E-6FBA-46FC-BE81-CD047C15B138</file>\n  <file>4537F376-6E1E-4CC5-B8C6-8F8680683767</file>\n  <param>7:0.6</param>\n  <cmd_line>spark-submit --class bda.spark.runnable.preprocess.FileSplitRunner spark.jar --input_pt ${appPath}/File_split-15bc2b97594-306b/00008E8E-6BBC-45A6-A7F4-A6C499E2A3A7/00008E8E-6BBC-45A6-A7F4-A6C499E2A3A7 --ratio 0.6 --output_pt1 ${appPath}/File_split-15bc2b9d556-f370/13C2F84E-6FBA-46FC-BE81-CD047C15B138/13C2F84E-6FBA-46FC-BE81-CD047C15B138 --output_pt2 ${appPath}/File_split-15bc2b9d556-f370/4537F376-6E1E-4CC5-B8C6-8F8680683767/4537F376-6E1E-4CC5-B8C6-8F8680683767</cmd_line>\n  <is_distributed>true</is_distributed>\n  <is_standalone_script>false</is_standalone_script>\n</widget>\n<widget type=\'program\'>\n  <id>LibSVM2LabeledPoint-15bc2b9f8ca-3180</id>\n  <moduleId>LibSVM2LabeledPoint</moduleId>\n  <oozJob>latest</oozJob>\n  <x>390</x>\n  <y>156</y>\n  <work_path>${appPath}/LibSVM2LabeledPoint-15bc2b9f8ca-3180/</work_path>\n  <file>9EF6C361-1D0B-42D6-B0AA-C0CECA9586DC</file>\n  <param>9:true</param>\n  <cmd_line>spark-submit --class bda.spark.runnable.formatTransform.LibSVM2LabeledPoint spark.jar --input_pt /EML/Data/Dataset/Dataset --output_pt ${appPath}/LibSVM2LabeledPoint-15bc2b9f8ca-3180/9EF6C361-1D0B-42D6-B0AA-C0CECA9586DC/9EF6C361-1D0B-42D6-B0AA-C0CECA9586DC --is_class true</cmd_line>\n  <is_distributed>true</is_distributed>\n  <is_standalone_script>false</is_standalone_script>\n</widget>\n<edge>\n  <source>DataSet-15bc2ba1b9b-fe1c:0</source>\n  <destination>LibSVM2LabeledPoint-15bc2b9f8ca-3180:0</destination>\n</edge>\n<edge>\n  <source>LibSVM2LabeledPoint-15bc2b9f8ca-3180:0</source>\n  <destination>File_split-15bc2b97594-306b:0</destination>\n</edge>\n<edge>\n  <source>File_split-15bc2b97594-306b:0</source>\n  <destination>File_split-15bc2b9d556-f370:0</destination>\n</edge>\n<edge>\n  <source>File_split-15bc2b9d556-f370:0</source>\n  <destination>GBRT_Train-15bc2b99d06-b3a7:0</destination>\n</edge>\n<edge>\n  <source>File_split-15bc2b97594-306b:1</source>\n  <destination>GBRT_Predict-15bc2b9b546-d790:1</destination>\n</edge>\n<edge>\n  <source>GBRT_Train-15bc2b99d06-b3a7:0</source>\n  <destination>GBRT_Predict-15bc2b9b546-d790:0</destination>\n</edge>\n<edge>\n  <source>GBRT_Train-15bc2b99d06-b3a7:0</source>\n  <destination>GBRT_Predict-15bc2b9c369-f641:0</destination>\n</edge>\n<edge>\n  <source>File_split-15bc2b9d556-f370:1</source>\n  <destination>GBRT_Predict-15bc2b9c369-f641:1</destination>\n</edge>\n<edge>\n  <source>GBRT_Predict-15bc2b9c369-f641:0</source>\n  <destination>RMSE-15bc2b909a8-346a:0</destination>\n</edge>\n</graph>', 'bdaict@hotmail.com', 'Use the GDBT regression model to predict abalone age', '2017-05-01 08:08:10', null, '1', '0000001-170501074411311-oozie-root-W');