vagrant-ansible-php
===================

An ansible provisioning to set-up a PHP development environment in Vagrant. Perfect for Symfony2, Silex, Laravel, etc. projects.

Used by [Ibsciss](www.ibsciss.com) for our php developments.

## What's inside ?

An Ubuntu precise64 vagrant box, with PHP5.5 & Ngninx ansible provisioning.

You'ill get all php stuff, plus :

* Composer
* Php cli
* Php sqlite

No Mysql (for the moment)

## Recommended workflow

1. Create a directory for your project (warning: don't git clone at this step): `$ mkdir my-project`.
2. Clone this repository inside a "provisioning" sub-directory: `$ git clone https://github.com/Ibsciss/vagrant-ansible-php my-project/provisioning`.
3. Clone your php project inside a "code" sub-directory: `$ git clone https://github.com/organization/my-project my-project/code`.
4. Go to the `provisioning` folder and run `vagrant up`: `$ cd my-project/provisioning` && `$ vagrant up`.

## Tips

### Cache & Log in-memory

One of the biggest issue with wagrant is dealing with large amount of I/O on the shared disk.
A solution is to put non-src repository which generate a lot of I/O, especially log & cache mecanism, in memory. On debian/ubuntu you have a `/dev/shm` which is a disk mounted in memory.

#### Symfony2

Overriding default cache & log directory can be achieve in `AppKernel.php` file :

```php
<?php
class AppKernel extends Kernel
{
    public function getCacheDir()
    {
        if (in_array($this->environment, array('dev', 'test'))) {
            return '/dev/shm/symfony/cache/' .  $this->environment;
        }
        return parent::getCacheDir();
    }

    public function getLogDir()
    {
        if (in_array($this->environment, array('dev', 'test'))) {
            return '/dev/shm/symfony/logs';
        }
        return parent::getLogDir();
    }
}
```

from [WhiteWashing.de](www.whitewashing.de/2013/08/19/speedup_symfony2_on_vagrant_boxes.html) a great blog about php & programming.



