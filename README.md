vagrant-ansible-php
===================

An ansible provisioning to set-up a PHP development environment in Vagrant. Tuned for modern php applications (Symfony2, Silex, Laravel, etc.)

We ([Ibsciss](www.ibsciss.com)) use it for our php developments.

## What's inside ?

Build on top of the default precise64 vagrant box, PHP5.5 & Ngninx ansible provisioning added.

Plus :

* Composer
* Php cli
* Php sqlite

No Mysql (for the moment)

## Requirements

* You need to have Ansible & Vagrant installed on your computer before you start.
* A NFS shared folder is used, so you need the `nfs-kernel-server` package on the host to use it : `apt-get install nfs-kernel-server`

## Recommended workflow

1. Create a directory for your project (warning: don't git clone at this step): `$ mkdir my-project`.
2. Clone this repository inside a "provisioning" sub-directory: `$ git clone https://github.com/Ibsciss/vagrant-ansible-php my-project/provisioning`.
3. Clone your php project inside a "code" sub-directory: `$ git clone https://github.com/organization/my-project my-project/code`.
4. Go to the `provisioning` folder and run `vagrant up`: `$ cd my-project/provisioning` && `$ vagrant up`.

## Tips

### in-memory cache & log

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



