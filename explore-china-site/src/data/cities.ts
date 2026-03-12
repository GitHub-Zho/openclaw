export interface Attraction {
  nameEn: string;
  nameZh: string;
  image: string;
  descEn: string;
  descZh: string;
  tagsEn: string[];
  tagsZh: string[];
}

export interface CityData {
  id: 'shanghai' | 'suzhou' | 'hangzhou' | 'beijing';
  dayLabelEn: string;
  dayLabelZh: string;
  nameEn: string;
  nameZh: string;
  taglineEn: string;
  taglineZh: string;
  heroBg: string;
  attractions: Attraction[];
}

export const cities: CityData[] = [
  {
    id: 'shanghai',
    dayLabelEn: 'Day 1–4',
    dayLabelZh: '第1–4天',
    nameEn: 'Shanghai',
    nameZh: '上海',
    taglineEn: 'Where East meets skyline — your gateway into China',
    taglineZh: '东西方在此相遇，以外滩为序章',
    heroBg: 'https://images.unsplash.com/photo-1538428494232-9c0d8a3ab403?auto=format&fit=crop&w=1920&q=85',
    attractions: [
      {
        nameEn: 'The Bund',
        nameZh: '外滩',
        image: 'https://images.unsplash.com/photo-1474181487882-5abf3f0ba6c2?auto=format&fit=crop&w=800&q=80',
        descEn: "The iconic waterfront promenade facing Pudong's futuristic skyline. Best experienced at dusk when the city shifts from gold to neon — a perfect first night introduction.",
        descZh: '黄浦江西岸的经典步道，与东岸陆家嘴现代天际线遥遥相对。傍晚时分，城市由金转霓虹，是抵达第一夜的完美开场。',
        tagsEn: ['Landmark', 'Night View', 'Architecture'],
        tagsZh: ['地标', '夜景', '建筑'],
      },
      {
        nameEn: 'Yu Garden',
        nameZh: '豫园',
        image: 'https://images.unsplash.com/photo-1559592413-7cec4d0cae2b?auto=format&fit=crop&w=800&q=80',
        descEn: 'A 400-year-old classical garden hidden inside the old city, featuring ornate rockeries, koi ponds, and traditional pavilions. Contrasts sharply with the skyscrapers just blocks away.',
        descZh: '隐于老城厢的四百年古典园林，假山、锦鲤与亭台错落有致。与几步之外的摩天楼形成强烈反差，是上海城市记忆的核心切片。',
        tagsEn: ['History', 'Garden', 'Heritage'],
        tagsZh: ['历史', '园林', '文化遗产'],
      },
      {
        nameEn: 'French Concession',
        nameZh: '法租界',
        image: 'https://images.unsplash.com/photo-1548919973-5cef591cdbc9?auto=format&fit=crop&w=800&q=80',
        descEn: 'Tree-lined avenues, art deco villas, and boutique cafés layered with colonial history. One of the best urban walks in Asia — ideal for a slow afternoon between big landmarks.',
        descZh: '梧桐大道、装饰艺术风格洋房与精品咖啡馆共存的历史街区。亚洲最值得慢走的城市社区之一，是大景点间最好的午后插曲。',
        tagsEn: ['Walking', 'Café', 'Street Life'],
        tagsZh: ['漫步', '咖啡', '街区文化'],
      },
      {
        nameEn: 'Xintiandi',
        nameZh: '新天地',
        image: 'https://images.unsplash.com/photo-1570168007204-dfb528c6958f?auto=format&fit=crop&w=800&q=80',
        descEn: "Restored shikumen architecture reborn as a dining and social hub. Great for the group's first shared dinner — familiar energy with distinctly Shanghai character.",
        descZh: '以石库门建筑为骨架改造而成的餐饮社交街区，是团队第一顿共同晚餐的理想地点——既有烟火气，又有海派气质。',
        tagsEn: ['Dining', 'Social', 'Architecture'],
        tagsZh: ['餐饮', '社交', '建筑'],
      },
    ],
  },
  {
    id: 'suzhou',
    dayLabelEn: 'Day 2 · Day Trip from Shanghai',
    dayLabelZh: '第2天 · 沪苏当日往返',
    nameEn: 'Suzhou',
    nameZh: '苏州',
    taglineEn: 'Classical gardens, ancient canals, and the soul of Jiangnan',
    taglineZh: '园林、运河与江南水乡的精神原乡',
    heroBg: 'https://images.unsplash.com/photo-1545569341-9eb8b30979d9?auto=format&fit=crop&w=1920&q=85',
    attractions: [
      {
        nameEn: "Humble Administrator's Garden",
        nameZh: '拙政园',
        image: 'https://images.unsplash.com/photo-1597073009515-9b1be8a72de0?auto=format&fit=crop&w=800&q=80',
        descEn: 'China\'s largest and most celebrated classical garden, a UNESCO World Heritage Site. Designed in the Ming Dynasty, its interplay of water, pavilions, and seasonal plants embodies the Jiangnan philosophy of borrowed scenery.',
        descZh: '中国最大的古典园林，联合国教科文组织世界遗产。明代造园，以水面、亭台与四季植物的层叠互借，诠释江南“借景”美学的最高范本。',
        tagsEn: ['UNESCO', 'Ming Dynasty', 'Classical Garden'],
        tagsZh: ['世界遗产', '明代', '古典园林'],
      },
      {
        nameEn: 'Suzhou Museum',
        nameZh: '苏州博物馆',
        image: 'https://images.unsplash.com/photo-1600166898405-da9535204843?auto=format&fit=crop&w=800&q=80',
        descEn: 'Designed by architect I. M. Pei, this museum is itself a work of art. The collections trace 3,000 years of Jiangnan craft, silk, and calligraphy.',
        descZh: '贝聿铭设计，建筑本身即是展品。馆藏涵盖三千年江南工艺、丝绸与书画，是建筑与历史的双重体验。',
        tagsEn: ['Architecture', 'I.M. Pei', 'Art'],
        tagsZh: ['建筑', '贝聿铭', '艺术'],
      },
      {
        nameEn: 'Shantang Street',
        nameZh: '山塘街',
        image: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?auto=format&fit=crop&w=800&q=80',
        descEn: 'A 1,200-year-old waterway street where bridges, boat lanterns, and canal-side teahouses preserve an unbroken sense of Jiangnan life.',
        descZh: '千年古运河街道，石桥、船灯与临水茶馆营造出完整的江南生活场景。傍晚水面的光影是中国最具代表性的画面之一。',
        tagsEn: ['Canal', 'Night Walk', 'Historic'],
        tagsZh: ['运河', '夜游', '历史街区'],
      },
    ],
  },
  {
    id: 'hangzhou',
    dayLabelEn: 'Day 5',
    dayLabelZh: '第5天',
    nameEn: 'Hangzhou',
    nameZh: '杭州',
    taglineEn: 'Heaven on earth — misty lakes, ancient temples, and the world\'s finest green tea',
    taglineZh: '人间天堂——烟雨西湖、千年古刹与龙井茶的故乡',
    heroBg: 'https://images.unsplash.com/photo-1536337005238-94b997371b40?auto=format&fit=crop&w=1920&q=85',
    attractions: [
      {
        nameEn: 'West Lake',
        nameZh: '西湖',
        image: 'https://images.unsplash.com/photo-1508739773434-c26b3d09e071?auto=format&fit=crop&w=800&q=80',
        descEn: 'A UNESCO World Heritage landscape that has inspired Chinese poets, painters, and emperors for over 2,000 years. The circuit walk around the lake is endlessly photogenic.',
        descZh: '列入世界遗产的千年名胜，历代诗人、画家与帝王的精神寄托。环湖步道穿过白堤、断桥与荷花丛，四季皆有绝景。',
        tagsEn: ['UNESCO', 'Lake', 'Walking Route'],
        tagsZh: ['世界遗产', '湖景', '步行路线'],
      },
      {
        nameEn: 'Lingyin Temple',
        nameZh: '灵隐寺',
        image: 'https://images.unsplash.com/photo-1545389336-cf090694435e?auto=format&fit=crop&w=800&q=80',
        descEn: 'One of China\'s most significant Buddhist temples, founded in 328 AD and nestled in a forested valley. A grounding counterpoint to the lake\'s serenity.',
        descZh: '中国最重要的佛教寺院之一，创建于东晋，隐于茂林幽谷之中。飞来峰石刻与香烟缭绕的大殿是这一天行程的精神重心。',
        tagsEn: ['Buddhism', 'Temple', '4th Century'],
        tagsZh: ['佛教', '古刹', '东晋'],
      },
      {
        nameEn: 'Longjing Tea Village',
        nameZh: '龙井茶村',
        image: 'https://images.unsplash.com/photo-1582793988951-9aed5509eb97?auto=format&fit=crop&w=800&q=80',
        descEn: 'The birthplace of Longjing green tea, where terraced fields climb hillsides just minutes from the city center. Watch hand-roasting and taste seasonal first flush tea.',
        descZh: '龙井绿茶原产地，距市中心仅20分钟的梯田茶园。可近距离观看手工炒茶，品尝当季新茶，是理解中国茶文化的最佳现场。',
        tagsEn: ['Tea Culture', 'Village', 'Tasting'],
        tagsZh: ['茶文化', '茶村', '品茶体验'],
      },
    ],
  },
  {
    id: 'beijing',
    dayLabelEn: 'Day 6–10 · Final Chapter',
    dayLabelZh: '第6–10天 · 终章',
    nameEn: 'Beijing',
    nameZh: '北京',
    taglineEn: 'Imperial legacy, living culture, and the best farewell a student trip can offer',
    taglineZh: '帝国遗产与活着的历史，学生旅行最好的收尾之地',
    heroBg: 'https://images.unsplash.com/photo-1508804185872-d7badad00f7d?auto=format&fit=crop&w=1920&q=85',
    attractions: [
      {
        nameEn: 'The Great Wall',
        nameZh: '长城',
        image: 'https://images.unsplash.com/photo-1508193638397-1c4234db14d8?auto=format&fit=crop&w=800&q=80',
        descEn: 'One of humanity\'s greatest architectural achievements. This route visits a well-preserved section that rewards the climb with uninterrupted ridge views.',
        descZh: '人类史上最宏大的建筑工程之一。本次行程选择保存完好的段落，登顶后视野开阔无遮挡，是全程最难忘的一天。',
        tagsEn: ['Day 7', 'UNESCO', 'Hiking'],
        tagsZh: ['第7天', '世界遗产', '徒步'],
      },
      {
        nameEn: 'The Forbidden City',
        nameZh: '故宫',
        image: 'https://images.unsplash.com/photo-1584646098378-0e14c5dee28f?auto=format&fit=crop&w=800&q=80',
        descEn: 'The world\'s largest and best-preserved wooden palace complex, home to 24 emperors across 5 centuries, arranged along a monumental north-south axis.',
        descZh: '世界上最大且保存最完整的木结构宫殿群，五百年间24位皇帝居所。近千殿堂沿中轴线排列，规模感极具震撼。',
        tagsEn: ['Day 8', 'UNESCO', 'Ming & Qing'],
        tagsZh: ['第8天', '世界遗产', '明清皇宫'],
      },
      {
        nameEn: 'Summer Palace',
        nameZh: '颐和园',
        image: 'https://images.unsplash.com/photo-1567596054592-37e5f3c90d9f?auto=format&fit=crop&w=800&q=80',
        descEn: 'An imperial garden built around Kunming Lake. The Long Corridor and lakeside pavilions offer a more intimate contrast to the scale of the Forbidden City.',
        descZh: '以昆明湖为中心构建的皇家园林。长廊、石舫与湖畔亭台提供了比故宫更亲近人的空间尺度。',
        tagsEn: ['Day 8', 'Imperial Garden', 'Lake'],
        tagsZh: ['第8天', '皇家园林', '湖景'],
      },
      {
        nameEn: 'Local Student Exchange',
        nameZh: '本地学生交流',
        image: 'https://images.unsplash.com/photo-1529156069898-49953e39b3ac?auto=format&fit=crop&w=800&q=80',
        descEn: 'A structured half-day exchange with local university students: shared meals, campus visit, and guided conversations focused on real connection.',
        descZh: '与北京本地大学生进行半天结构化交流：共同用餐、校园参访与引导式对话。目标是真实连接，不是仪式活动。',
        tagsEn: ['Day 9', 'Exchange', 'People'],
        tagsZh: ['第9天', '交流', '人与人的连接'],
      },
      {
        nameEn: 'Closing Night',
        nameZh: '结营之夜',
        image: 'https://images.unsplash.com/photo-1517457373958-b7bdd4587205?auto=format&fit=crop&w=800&q=80',
        descEn: 'The final evening of the program — shared dinner, reflection circle, and open city night. Ten days of travel compressed into one memorable table.',
        descZh: '项目最后一晚：共同晚餐、回顾环节与北京夜生活。十天旅程浓缩在同一张桌旁，成为最有情绪价值的收尾。',
        tagsEn: ['Day 9', 'Social', 'Farewell'],
        tagsZh: ['第9天', '社交', '告别之夜'],
      },
    ],
  },
];
