README

Les codes sources sont présents dans le dossier code.
Un script permettant de compiler et d'élaborer les testbenchs est présents dans le dossier "code/compilation"
/!\ ATTENTION /!\
Les entités créées en double (signed & unsigned) n'ont qu'un seul testbench. Il y aura donc une erreur de compilation, la commande affichera qu'elle ne peut accéder au fichier demandé (à juste titre).

Un exemple de compilation :
./compilation alu
cette commande compilera le composant alu. L'argument attendu est le nom de dossier du composant à compiler.

Si l'on désire supprimer les fichiers créés il suffit d'exécuter la commande ./clean (se trouvant aussi dans le répertoire compilation).