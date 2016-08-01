SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `sozounltsnapads`
--

CREATE DATABASE IF NOT EXISTS sozounltsnapads
DEFAULT CHARACTER SET utf8
COLLATE utf8_general_ci;

USE sozounltsnapads;


--
-- Structure de la table `ads`
--

CREATE TABLE `ads` (
  `id_ad` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_photo` int(11) NOT NULL,
  `id_location` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `ad_title` varchar(64) NOT NULL,
  `ad_begin_date` date NOT NULL,
  `ad_end_date` date NOT NULL,
  `ad_actual_price` decimal(20,2) NOT NULL,
  `ad_old_price` decimal(20,2) NOT NULL,
  `ad_pos_longitude` decimal(7,5) NOT NULL,
  `ad_pos_latitude` decimal(7,5) NOT NULL,
  `ad_description` varchar(255) NOT NULL,
  `ad_state` tinyint(4) NOT NULL,
  `ad_activate` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id_category` int(11) NOT NULL,
  `category_name` varchar(45) NOT NULL,
  `category_activate` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Structure de la table `companies`
--

CREATE TABLE `companies` (
  `id_company` int(11) NOT NULL,
  `id_location` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `company_name` varchar(45) NOT NULL,
  `company_siret` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure de la table `follow`
--

CREATE TABLE `follow` (
  `id_follow` int(11) NOT NULL,
  `id_ad` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `interests`
--

CREATE TABLE `interests` (
  `id_user_interest` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `locations`
--

CREATE TABLE `locations` (
  `id_location` int(11) NOT NULL,
  `street_name` varchar(45) NOT NULL,
  `city_name` varchar(32) NOT NULL,
  `zipcode` int(11) NOT NULL,
  `country` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Structure de la table `photos`
--

CREATE TABLE `photos` (
  `id_photo` int(11) NOT NULL,
  `photo_name` varchar(45) NOT NULL,
  `photo_folder` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure de la table `settings`
--

CREATE TABLE `settings` (
  `id_setting` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_follow` int(11) NOT NULL,
  `setting_notification` tinyint(4) NOT NULL,
  `setting_newsletter` tinyint(4) NOT NULL,
  `setting_radius` tinyint(4) NOT NULL,
  `setting_user_categories` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `id_location` int(11) NOT NULL,
  `id_company` int(11) NOT NULL,
  `user_firstname` varchar(32) NOT NULL,
  `user_lastname` varchar(32) NOT NULL,
  `user_nickname` varchar(32) NOT NULL,
  `user_login` varchar(32) NOT NULL,
  `user_password` varchar(32) NOT NULL,
  `user_email` varchar(128) NOT NULL,
  `user_telephone` int(11) NOT NULL,
  `user_last_pass_gen` datetime NOT NULL,
  `user_active` tinyint(4) NOT NULL,
  `user_deleted` tinyint(4) NOT NULL,
  `user_type` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id_ad`),
  ADD KEY `categories_ads_fk` (`id_category`),
  ADD KEY `locations_ads_fk` (`id_location`),
  ADD KEY `users_ads_fk` (`id_user`),
  ADD KEY `photos_ads_fk` (`id_photo`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`);

--
-- Index pour la table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id_company`),
  ADD KEY `categories_companies_fk` (`id_category`),
  ADD KEY `locations_companies_fk` (`id_location`);

--
-- Index pour la table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id_follow`),
  ADD KEY `users_follow_fk` (`id_user`),
  ADD KEY `ads_follow_fk` (`id_ad`);

--
-- Index pour la table `interests`
--
ALTER TABLE `interests`
  ADD PRIMARY KEY (`id_user_interest`,`id_category`),
  ADD KEY `categories_interests_fk` (`id_category`),
  ADD KEY `users_interests_fk` (`id_user`);

--
-- Index pour la table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id_location`);

--
-- Index pour la table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id_photo`);

--
-- Index pour la table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id_setting`),
  ADD KEY `users_settings_fk` (`id_user`),
  ADD KEY `follow_settings_fk` (`id_follow`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `locations_users_fk` (`id_location`),
  ADD KEY `companies_users_fk` (`id_company`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `ads`
--
ALTER TABLE `ads`
  MODIFY `id_ad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `companies`
--
ALTER TABLE `companies`
  MODIFY `id_company` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `follow`
--
ALTER TABLE `follow`
  MODIFY `id_follow` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `interests`
--
ALTER TABLE `interests`
  MODIFY `id_user_interest` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `locations`
--
ALTER TABLE `locations`
  MODIFY `id_location` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `photos`
--
ALTER TABLE `photos`
  MODIFY `id_photo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `settings`
--
ALTER TABLE `settings`
  MODIFY `id_setting` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `ads`
--
ALTER TABLE `ads`
  ADD CONSTRAINT `categories_ads_fk` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `locations_ads_fk` FOREIGN KEY (`id_location`) REFERENCES `locations` (`id_location`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `photos_ads_fk` FOREIGN KEY (`id_photo`) REFERENCES `photos` (`id_photo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `users_ads_fk` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `categories_companies_fk` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `locations_companies_fk` FOREIGN KEY (`id_location`) REFERENCES `locations` (`id_location`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `ads_follow_fk` FOREIGN KEY (`id_ad`) REFERENCES `ads` (`id_ad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `users_follow_fk` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `interests`
--
ALTER TABLE `interests`
  ADD CONSTRAINT `categories_interests_fk` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `users_interests_fk` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `follow_settings_fk` FOREIGN KEY (`id_follow`) REFERENCES `follow` (`id_follow`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `users_settings_fk` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `companies_users_fk` FOREIGN KEY (`id_company`) REFERENCES `companies` (`id_company`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `locations_users_fk` FOREIGN KEY (`id_location`) REFERENCES `locations` (`id_location`) ON DELETE NO ACTION ON UPDATE NO ACTION;





--LES INSERTIONS --

--TO DO -- 
--ALTER TABLE `sozounltsnapads`.`users`
--CHANGE COLUMN `user_last_pass_gen` `user_last_pass_gen` DATETIME NOT NULL ;
--



--
-- Reset et Insertions des categories
--

ALTER TABLE categories AUTO_INCREMENT = 1;
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Alimentation', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Vin-Spiritueux', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Auto-Moto', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Restaurants', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Beauté/Bien Être', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Bricolage', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Electro-Ménager', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Décoration', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Mobilier', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Sorties-Spectacles', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Mode', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Informatique', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Audio-Vidéo', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Santé', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('Sport', '1');
INSERT INTO `sozounltsnapads`.`categories` (`category_name`, `category_activate`) VALUES ('nouveautés', '1');


-
-- Reset et Insertions des locations
--

ALTER TABLE locations AUTO_INCREMENT = 1;
INSERT INTO `sozounltsnapads`.`locations` (`street_name`, `city_name`, `zipcode`, `country`) VALUES ('22 bis avenue du président kennedy', 'Rosny sous bois ', '93110', 'France');


--
-- Reset et Insertions des photo
--
ALTER TABLE photos AUTO_INCREMENT = 1;
INSERT INTO `sozounltsnapads`.`photos` (`photo_name`, `photo_folder`) VALUES ('profil.jpg', 'photo');


--
--Reset et insertions des companies
--
ALTER TABLE companies AUTO_INCREMENT = 1;
INSERT INTO `sozounltsnapads`.`companies` (`id_location`, `id_category`, `company_name`, `company_siret`) VALUES ('1', '2', 'Karrington création', '732 829 320 00074');


--
--Reset et insertions des utilisateurs
--
ALTER TABLE users AUTO_INCREMENT = 1;
INSERT INTO `sozounltsnapads`.`users` (`id_location`, `id_company`, `user_firstname`, `user_lastname`, `user_nickname`, `user_login`, `user_password`, `user_email`, `user_telephone`, `user_last_pass_gen`, `user_active`, `user_deleted`, `user_type`) VALUES ('1', '1', 'Alban', 'Mabiala', 'karrington', 'dready92', '415263crap', 'karrington.creation@gmail.com', '0611196737', '415263Cr@p', '1', '1', '1');


--
--Reset et insertions des annonces
--

ALTER TABLE ads AUTO_INCREMENT = 1;
INSERT INTO `ads` (`id_ad`, `id_category`, `id_photo`, `id_location`, `id_user`, `ad_title`, `ad_begin_date`, `ad_end_date`, `ad_actual_price`, `ad_old_price`, `ad_pos_longitude`, `ad_pos_latitude`, `ad_description`, `ad_state`, `ad_activate`) VALUES
(2, 1, 1, 1, 1, 'Test du titre', '0000-00-00', '0000-00-00', '26.00', '35.00', '99.99999', '99.99999', 'lorem ipsum sit dolor amet', 1, 1),
(3, 1, 1, 1, 1, 'Test du titre', '0000-00-00', '0000-00-00', '26.00', '35.00', '99.99999', '99.99999', 'lorem ipsum sit dolor amet', 1, 1),
(4, 1, 1, 1, 1, 'annonce2', '0000-00-00', '0000-00-00', '26.00', '35.00', '99.99999', '99.99999', 'lorem ipsum sit dolor amet', 1, 1),
(5, 1, 1, 1, 1, 'annonce2', '0000-00-00', '0000-00-00', '26.00', '35.00', '99.99999', '99.99999', 'lorem ipsum sit dolor amet', 1, 1),
(6, 1, 1, 1, 1, 'annonce2', '0000-00-00', '0000-00-00', '26.00', '35.00', '99.99999', '99.99999', 'lorem ipsum sit dolor amet', 1, 1),
(7, 1, 1, 1, 1, 'Test du titre', '0000-00-00', '0000-00-00', '26.00', '35.00', '99.99999', '99.99999', 'lorem ipsum sit dolor amet', 1, 1),
(8, 1, 1, 1, 1, 'Test du titre', '0000-00-00', '0000-00-00', '26.00', '35.00', '99.99999', '99.99999', 'lorem ipsum sit dolor amet', 1, 1),
(18, 1, 1, 1, 1, 'Test du titre', '0000-00-00', '0000-00-00', '26.00', '35.00', '99.99999', '99.99999', 'lorem ipsum sit dolor amet', 1, 1),
(22, 1, 1, 1, 1, 'Test du titre', '0000-00-00', '0000-00-00', '26.00', '35.00', '99.99999', '99.99999', 'lorem ipsum sit dolor amet', 1, 1),
(23, 1, 1, 1, 1, 'Test du titre', '0000-00-00', '0000-00-00', '26.00', '35.00', '99.99999', '99.99999', 'lorem ipsum sit dolor amet', 1, 1),
(26, 1, 1, 1, 1, 'dsdsdsdsdsdsdsddsdsds', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1),
(41, 1, 1, 1, 1, 'dsdsdsdsdsdsdsddsdsds', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1),
(42, 1, 1, 1, 1, 'dsdsdsdsdsdsdsddsdsds', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1),
(43, 1, 1, 1, 1, 'eazeeazeaeazeazeaz', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1),
(55, 1, 1, 1, 1, 'sdqsdqsdqsdaaaaa', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1),
(56, 1, 1, 1, 1, 'sdqsdqsdqsdaaaaa', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1),
(57, 1, 1, 1, 1, 'sdqsdqsdqsdaaaaa', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1),
(58, 1, 1, 1, 1, 'sdqsdqsdqsdaaaaa', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1),
(59, 1, 1, 1, 1, 'sdqsdqsdqsdaaaaa', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1),
(63, 1, 1, 1, 1, 'dfgfgfgfdgfg', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1),
(64, 1, 1, 1, 1, 'dfgfgfgfdgfg', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1),
(65, 1, 1, 1, 1, 'dfgfgfgfdgfg', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1),
(66, 1, 1, 1, 1, 'dfgfgfgfdgfg', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1),
(67, 1, 1, 1, 1, 'dfgfgfgfdgfg', '0000-00-00', '0000-00-00', '12.00', '15.00', '99.99999', '0.00000', 'lorem ipsum sit dolor amet', 1, 1);



