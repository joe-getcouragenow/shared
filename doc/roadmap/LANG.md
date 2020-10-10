# LANG

Needs refactoring to support v3 needs

- video conf with audio transliteraction in each users lang

Protobuf api

Choice of store
- disk
- dB

Engine
- detect wrong spelling ans suggest 

Diff
- need to diff so we can detect if in the engine we even need to do a translation
- can show to human what has changed so they only check / override that

Type
- for each translation we need to hold an override for each language

Source ( better word )
-need to know the source of a translation. For dev it will always be English. But for runtime it can be any language 

Loading
- need GUI translations to load via the server so that the pwa is not huge

Agnostic
- disk versus dB should use the identical proto. This will make it much easier to develop with the system. Maybe just use a table to represent a folder. And store the binary protobuf. This will make it version proof

SDK
- In Amin have an area just for viewing translations that a human translator can see and search. Because the type is proto they can see disk and dB translations.
- a special role will be needed
- in Real App show the translation hints
 - link from admin to real so they can see where the translation is used and modify for bad lengths
- reverse link from the app back to the admin
- if disk store then when they do an override we need to update the file and reload it. Hence why all disk translations need to come from server. We should try to only reload that one translation, which requires the translations to be stored in Hive Cache and then update the GUI. Yes this is a good design. We can reuse the hive cache architecture/ make sure if it changes in disk of dB the underlying message broker pushes the update. 

GUI data in the dB
- time space module needs its GUI data to be in many languages. So will mod-survey
- the store will be dB because the other tables need to reference this data. Mod-survey will need it and mod-time space.
- so we should load the data into the dB and have the Lang engine and Lang diff run off the dB / disk !
- then the architecture can cope with all the use cases.
- so the engine is really part of sys-core
- developers never need to do a translation. It’s picked up by the sys-core engine, diffed and then machine translated and then change feed updates the GUI ( both Admin and Real ). Now we have a Unidirectional architecture. Maybe we abstract the disk store to a rurally be the dB , because the GUI Lang files are being managed by the Lang DB anyway. Yes we do

One last bit

Use disk during dev and human translation time.

Then at deployment time these can be embedded and then update the dB 

Migration of data I think won’t be needed unless the protobuf Schema changes and then it should be easy because the old protobuf is still there to use.

This really show how using protobufs with the dB directly for all the architecture is superior because the protobuf is the Schema. 

Anyway this looks almost perfect now