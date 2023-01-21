<!-- Improved compatibility of back to top link: See: https://github.com/marchandmd/little-esty-shop-final/pull/73 -->

<a name="readme-top"></a>

<!--
*** Thanks for checking out the little-esty-shop-final. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">

  <h1 align="center">Little Esty Shop</h1>

  <p align="center">
    <h3>Monolithic Rails app with complex DB structure, heavy ActiveRecord/SQL querying and API consumption</h3>
    <br />
  <img src="app/assets/images/les_screenshot.jpg" />
    <br />
    <a href="https://github.com/MarchandMD/little-esty-shop-final"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/marchandmd/little-esty-shop-final">View Demo</a>
    ·
    <a href="https://github.com/marchandmd/little-esty-shop-final/issues">Report Bug</a>
    ·
    <a href="https://github.com/marchandmd/little-esty-shop-final/issues">Request Feature</a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#schema">Schema</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->

## About The Project

"Little Esty Shop" is a group project that required me to build a fictitious e-commerce platform where merchants and admins can manage inventory and fulfill customer invoices.

Concepts learned during this project:

- Building custom Rake tasks to import CSV data
- User Stories to drive completion of features
- Following wireframes to guide front end design
- Practice designing a normalized database schema and defining model relationships
- Utilize advanced routing techniques including namespacing to organize and group like functionality together.
- Utilize advanced active record techniques to perform complex database queries
- Practice consuming a public API while utilizing POROs as a way to apply OOP principles to organize code


<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

-   [![Ruby][ruby.com]][ruby-url]
-   [![Rspec][rspec.com]][rspec-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## Getting Started

### Prerequisites

- ruby version 2.7.4

### Installation

1. Clone the repo
    ```sh
    git clone https://github.com/marchandmd/little-esty-shop-final.git
    ```
2. Install packages
    ```sh
    bundle
    ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Schema -->

## Schema

<img src="app/assets/images/les_schema.jpg" />


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->

## Usage

Will need to add the databases by running `rails db:{create,migrate}`

You can see this locally by running `rails s` from the command line.


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->

## Roadmap

- README
- [ ] Deploy to Heroku student account
- [ ] Add to marchandmd.github.io

See the [open issues](https://github.com/marchandmd/little-esty-shop-final/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->

## Contact

Michael Marchand - MichaelDavidMarchand@gmail.com

Project Link: [https://github.com/MarchandMD/little-esty-shop-final](https://github.com/marchandmd/little-esty-shop-final)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->

## Acknowledgments

Some great tools and/or people who helped to make this project what it is!

-   [Choose an Open Source License](https://choosealicense.com)
-   [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)
-   [Img Shields](https://shields.io)
-   [GitHub Pages](https://pages.github.com)
-   [Rubocop](https://rubocop.org/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github/contributors/marchandmd/little-esty-shop-final.svg?style=for-the-badge
[contributors-url]: https://github.com/marchandmd/little-esty-shop-final/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/marchandmd/little-esty-shop-final.svg?style=for-the-badge
[forks-url]: https://github.com/marchandmd/little-esty-shop-final/network/members
[stars-shield]: https://img.shields.io/github/stars/marchandmd/little-esty-shop-final.svg?style=for-the-badge
[stars-url]: https://github.com/marchandmd/little-esty-shop-final/stargazers
[issues-shield]: https://img.shields.io/github/issues/marchandmd/little-esty-shop-final.svg?style=for-the-badge
[issues-url]: https://github.com/marchandmd/little-esty-shop-final/issues
[license-shield]: https://img.shields.io/github/license/marchandmd/little-esty-shop-final.svg?style=for-the-badge
[license-url]: https://github.com/marchandmd/little-esty-shop-final/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/mmarchand1/
[product-screenshot]: images/screenshot.png
[bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[bootstrap-url]: https://getbootstrap.com
[ruby.com]: https://img.shields.io/badge/ruby-v2.7.4-red
[ruby-url]: https://ruby-doc.org/core-2.7.2/
[rspec.com]: https://img.shields.io/badge/rspec-v3.12-success
[rspec-url]: https://rspec.info/documentation/
