.class public Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "AppRecommendationActivity.java"


# instance fields
.field private descriptions:[Ljava/lang/String;

.field private icons:[I

.field private layoutIds:[I

.field private titles:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 9

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x6

    .line 15
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    .line 17
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "YouCam Perfect"

    aput-object v1, v0, v4

    const-string v1, "YouCam Makeup"

    aput-object v1, v0, v5

    const-string v1, "Fotor Photo Editor"

    aput-object v1, v0, v6

    const-string v1, "Easy Voice Recorder"

    aput-object v1, v0, v7

    const/4 v1, 0x4

    const-string v2, "All-In-One Toolbox"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "AMC Security"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity;->titles:[Ljava/lang/String;

    .line 18
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "Perfect Selfies at Your Fingertips."

    aput-object v1, v0, v4

    const-string v1, "The Smart Cosmetic Kit in Your Purse."

    aput-object v1, v0, v5

    const-string v1, "Top all-in-one photo editor with tons of classic & magazine collage styles."

    aput-object v1, v0, v6

    const-string v1, "Easy Voice Recorder is a fun, simple and easy to use audio & voice recorder."

    aput-object v1, v0, v7

    const/4 v1, 0x4

    const-string v2, "Useful tools collection to cleanup, speedup and optimize your Android."

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "AMC Security is a top-rated all-in-one security protector, cleaner and booster app which is developed by IObit."

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity;->descriptions:[Ljava/lang/String;

    .line 26
    new-array v0, v3, [I

    fill-array-data v0, :array_54

    iput-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity;->icons:[I

    .line 34
    new-array v0, v3, [I

    fill-array-data v0, :array_64

    iput-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity;->layoutIds:[I

    return-void

    .line 26
    nop

    :array_54
    .array-data 4
        0x7f0201ed
        0x7f0201ec
        0x7f0201eb
        0x7f0201ea
        0x7f0201e8
        0x7f0201e9
    .end array-data

    .line 34
    :array_64
    .array-data 4
        0x7f0f00a7
        0x7f0f00a8
        0x7f0f00a9
        0x7f0f00aa
        0x7f0f00ab
        0x7f0f00ac
    .end array-data
.end method

.method private display_featured_apps()V
    .registers 6

    .prologue
    .line 53
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v3, p0, Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity;->layoutIds:[I

    array-length v3, v3

    if-ge v1, v3, :cond_59

    .line 55
    iget-object v3, p0, Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity;->layoutIds:[I

    aget v3, v3, v1

    invoke-virtual {p0, v3}, Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 56
    .local v2, "layout":Landroid/widget/LinearLayout;
    const v3, 0x7f0f02eb

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iget-object v4, p0, Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity;->icons:[I

    aget v4, v4, v1

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 57
    const v3, 0x7f0f02ec

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iget-object v4, p0, Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity;->titles:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    const v3, 0x7f0f02ed

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iget-object v4, p0, Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity;->descriptions:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    const v3, 0x7f0f02ef

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 61
    .local v0, "appInstallButton":Landroid/widget/Button;
    const-string v3, "Install"

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 62
    new-instance v3, Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity$1;

    invoke-direct {v3, p0, v2}, Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity$1;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity;Landroid/widget/LinearLayout;)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 53
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 69
    .end local v0    # "appInstallButton":Landroid/widget/Button;
    .end local v2    # "layout":Landroid/widget/LinearLayout;
    :cond_59
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 73
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 74
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_4e

    .line 95
    :goto_e
    invoke-virtual {p0, v0}, Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity;->startActivity(Landroid/content/Intent;)V

    .line 96
    return-void

    .line 77
    :pswitch_12
    const-string v1, "http://bit.ly/1FUJSD4"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_e

    .line 80
    :pswitch_1c
    const-string v1, "http://bit.ly/17PDSQR"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_e

    .line 83
    :pswitch_26
    const-string v1, "http://ad.apps.fm/WUGLCzKbyUp7lWtFuqZ7h15KLoEjTszcQMJsV6-2VnHFDLXitVHB6BlL95nuoNYfRieKoFRBIO1JPVarcVv3FaHlsfpghNYRY7y09lyb7KsNHr2OTuRALBsWfXOZO-ZQjyh3zEiS8M3iaRjj-jopow"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_e

    .line 86
    :pswitch_30
    const-string v1, "market://details?id=com.coffeebeanventures.easyvoicerecorder&referrer=utm_source%3Dpencilsketch%26utm_campaign%3Dinstallexchange"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_e

    .line 89
    :pswitch_3a
    const-string v1, "https://play.google.com/store/apps/details?id=imoblife.toolbox.full&referrer=utm_source%3D%2520PencilSketch%26utm_medium%3Dicon%26anid%3Dadmob"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_e

    .line 92
    :pswitch_44
    const-string v1, "https://play.google.com/store/apps/details?id=com.iobit.mobilecare&referrer=utm_source%3DPSket%26utm_medium%3Dxpromo"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_e

    .line 74
    :pswitch_data_4e
    .packed-switch 0x7f0f00a7
        :pswitch_12
        :pswitch_1c
        :pswitch_26
        :pswitch_30
        :pswitch_3a
        :pswitch_44
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 46
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 47
    const v0, 0x7f030020

    invoke-virtual {p0, v0}, Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity;->setContentView(I)V

    .line 49
    invoke-direct {p0}, Lcom/dumplingsandwich/pencilsketch/activities/AppRecommendationActivity;->display_featured_apps()V

    .line 50
    return-void
.end method
