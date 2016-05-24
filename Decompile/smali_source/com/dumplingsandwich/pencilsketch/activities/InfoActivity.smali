.class public Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "InfoActivity.java"


# instance fields
.field private mAdobeAuthManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

.field private mLogoutClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLogoutObserver;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 23
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;)V
    .registers 1
    .param p0, "x0"    # Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;->adobeSignOut()V

    return-void
.end method

.method private adobeSignOut()V
    .registers 3

    .prologue
    .line 134
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;->mAdobeAuthManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    iget-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;->mLogoutClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLogoutObserver;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->registerLogoutClient(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLogoutObserver;)V

    .line 135
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;->mAdobeAuthManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->logout()V

    .line 137
    invoke-virtual {p0}, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;->invalidateOptionsMenu()V

    .line 138
    return-void
.end method

.method private initializeAdobeAccountManager()V
    .registers 3

    .prologue
    .line 38
    new-instance v0, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity$1;

    invoke-direct {v0, p0}, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity$1;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;)V

    iput-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;->mLogoutClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLogoutObserver;

    .line 51
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->sharedAuthManager()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    move-result-object v0

    iput-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;->mAdobeAuthManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    .line 52
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;->mAdobeAuthManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    iget-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;->mLogoutClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLogoutObserver;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->registerLogoutClient(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLogoutObserver;)V

    .line 53
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 9
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 57
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v5

    packed-switch v5, :pswitch_data_58

    .line 82
    :goto_7
    return-void

    .line 60
    :pswitch_8
    new-instance v2, Landroid/content/Intent;

    const-string v5, "android.intent.action.VIEW"

    invoke-direct {v2, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 61
    .local v2, "rateIntent":Landroid/content/Intent;
    const-string v5, "market://details?id=com.dumplingsandwich.pencilsketch"

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 62
    invoke-virtual {p0, v2}, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_7

    .line 65
    .end local v2    # "rateIntent":Landroid/content/Intent;
    :pswitch_1c
    new-instance v4, Landroid/content/Intent;

    const-string v5, "android.intent.action.VIEW"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 66
    .local v4, "upgradeIntent":Landroid/content/Intent;
    const-string v5, "market://details?id=com.dumplingsandwich.pencilsketchpro"

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 67
    invoke-virtual {p0, v4}, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_7

    .line 70
    .end local v4    # "upgradeIntent":Landroid/content/Intent;
    :pswitch_30
    new-instance v3, Landroid/content/Intent;

    const-class v5, Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity;

    invoke-direct {v3, p0, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 71
    .local v3, "recommendedApps":Landroid/content/Intent;
    invoke-virtual {p0, v3}, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_7

    .line 74
    .end local v3    # "recommendedApps":Landroid/content/Intent;
    :pswitch_3b
    new-instance v0, Landroid/content/Intent;

    const-string v5, "android.intent.action.VIEW"

    const-string v6, "https://www.facebook.com/pencilsketchds/"

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-direct {v0, v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 75
    .local v0, "browserIntent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_7

    .line 78
    .end local v0    # "browserIntent":Landroid/content/Intent;
    :pswitch_4c
    new-instance v1, Landroid/content/Intent;

    const-class v5, Lcom/dumplingsandwich/pencilsketch/activities/DumplingSandwichAppsActivity;

    invoke-direct {v1, p0, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 79
    .local v1, "dumplingSandwichAppsIntent":Landroid/content/Intent;
    invoke-virtual {p0, v1}, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_7

    .line 57
    nop

    :pswitch_data_58
    .packed-switch 0x7f0f00bf
        :pswitch_8
        :pswitch_1c
        :pswitch_30
        :pswitch_4c
        :pswitch_3b
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 31
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 32
    const v0, 0x7f030023

    invoke-virtual {p0, v0}, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;->setContentView(I)V

    .line 34
    invoke-direct {p0}, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;->initializeAdobeAccountManager()V

    .line 35
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .registers 4
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 101
    invoke-virtual {p0}, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    .line 102
    .local v0, "inflater":Landroid/view/MenuInflater;
    const v1, 0x7f10000b

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 103
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v1

    return v1
.end method

.method protected onDestroy()V
    .registers 3

    .prologue
    .line 142
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onDestroy()V

    .line 144
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;->mAdobeAuthManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    iget-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;->mLogoutClient:Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLogoutObserver;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->unregisterLogoutClient(Lcom/adobe/creativesdk/foundation/internal/auth/IAdobeAuthLogoutObserver;)V

    .line 145
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 7
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 109
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    packed-switch v2, :pswitch_data_48

    .line 129
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v2

    :goto_b
    return v2

    .line 111
    :pswitch_c
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "Adobe Creative Cloud"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f020040

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string v3, "Cancel"

    new-instance v4, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity$2;

    invoke-direct {v4, p0}, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity$2;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 117
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    iget-object v2, p0, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;->mAdobeAuthManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->isAuthenticated()Z

    move-result v2

    if-eqz v2, :cond_45

    .line 119
    const-string v1, "You are logged in on Adobe Creative Cloud. Now you can unlock supplies for free in photo editor."

    .line 120
    .local v1, "message":Ljava/lang/String;
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string v3, "Sign Out"

    new-instance v4, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity$3;

    invoke-direct {v4, p0}, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity$3;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 127
    .end local v1    # "message":Ljava/lang/String;
    :cond_45
    const/4 v2, 0x1

    goto :goto_b

    .line 109
    nop

    :pswitch_data_48
    .packed-switch 0x7f0f031b
        :pswitch_c
    .end packed-switch
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .registers 4
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    const v1, 0x7f0f031b

    .line 86
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/InfoActivity;->mAdobeAuthManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->isAuthenticated()Z

    move-result v0

    if-eqz v0, :cond_18

    .line 88
    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 95
    :goto_13
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0

    .line 92
    :cond_18
    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_13
.end method
