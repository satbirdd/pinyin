# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create(%w({ name: 'Chicago' } { name: 'Copenhagen' }))
#   Mayor.create(name: 'Emanuel' city: cities.first)


letters = {
  "单韵母" => %w(ā á ǎ à ō ó ǒ ò ē é ě è ī í ǐ ì ū ú ǔ ù ǖ ǘ ǚ ǜ),
  "复韵母" => %w(āi ái ǎi ài ēi éi ěi èi uī uí uǐ uì āo áo ǎo ào ōu óu ǒu òu iū iú iǔ iù iē ié iě iè üē üé üě üè ēr ér ěr èr),
  "前鼻韵母" => %w(ān án ǎn àn ēn én ěn èn īn ín ǐn ìn ūn ún ǔn ùn ǖn ǘn ǚn ǜn),
  "后鼻韵母" => %w(āng áng ǎng àng ēng éng ěng èng īng íng ǐng ìng ōng óng ǒng òng),
  "整体认读" => %w(zhī zhí zhǐ zhì chī chí chǐ chì shī shí shǐ shì rī rí rǐ rì zī zí zǐ zì cī cí cǐ cì sī sí sǐ sì yī yí yǐ yì wū wú wǔ wù yū yú yǔ yù yē yé yě yè yuē yué yuě yuè yuān yuán yuǎn yuàn yīn yín yǐn yìn yūn yún yǔn yùn yīng yíng yǐng yìng),
  "声母" => %w(b p m f d t n l g k h j q x zh ch sh r z c s y w)
}