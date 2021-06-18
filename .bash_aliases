# GDrive Syncing
alias sun='rclone sync -P ~/Documents/PhD/ notes-drive:PhD/Ubuntu_Sync/'
alias sdn='rclone sync -P notes-drive:PhD/Ubuntu_Sync/ ~/Documents/PhD/'
alias uxplay='./UxPlay/build/uxplay'

# Aliases useful for notetaking

qnote() {
    NOTES_DIR=$HOME/Documents/PhD/PhD-notes/Inbox/
    cd $NOTES_DIR
    TIMESTAMP=`date +"%d%m%Y%H%M%S"`
    vim $TIMESTAMP.md
}
