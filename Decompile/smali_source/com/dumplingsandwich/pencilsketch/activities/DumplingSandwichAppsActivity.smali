.class public Lcom/dumplingsandwich/pencilsketch/activities/DumplingSandwichAppsActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "DumplingSandwichAppsActivity.java"


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

    const-string v1, "Water Reflection"

    aput-object v1, v0, v4

    const-string v1, "Photo Gifts"

    aput-object v1, v0, v5

    const-string v1, "Sketch Master"

    aput-object v1, v0, v6

    const-string v1, "Cartoon Maker"

    aput-object v1, v0, v7

    const/4 v1, 0x4

    const-string v2, "Toolbox for Android"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "Focus Effect"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/DumplingSandwichAppsActivity;->titles:[Ljava/lang/String;

    .line 18
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "Generate realistic water ripple reflection of your photos"

    aput-object v1, v0, v4

    const-string v1, "Create beautiful & personalized photo gifts on your phone"

    aput-object v1, v0, v5

    const-string v1, "A master collection of sketch effects"

    aput-object v1, v0, v6

    const-string v1, "Automatic cartoon generator"

    aput-object v1, v0, v7

    const/4 v1, 0x4

    const-string v2, "An all-in-one toolbox for your android phones"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "Make your photo focus"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/DumplingSandwichAppsActivity;->descriptions:[Ljava/lang/String;

    .line 26
    new-array v0, v3, [I

    fill-array-data v0, :array_54

    iput-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/DumplingSandwichAppsActivity;->icons:[I

    .line 34
    new-array v0, v3, [I

    fill-array-data v0, :array_64

    iput-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/DumplingSandwichAppsActivity;->layoutIds:[I

    return-void

    .line 26
    nop

    :array_54
    .array-data 4
        0x7f020188
        0x7f020186
        0x7f020187
        0x7f020184
        0x7f020183
        0x7f020185
    .end array-data

    .line 34
    :array_64
    .array-data 4
        0x7f0f009a
        0x7f0f009b
        0x7f0f009c
        0x7f0f009d
        0x7f0f009e
        0x7f0f009f
    .end array-data
.end method

.method private display_featured_apps()V
    .registers 6

    .prologue
    .line 54
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v3, p0, Lcom/dumplingsandwich/pencilsketch/activities/DumplingSandwichAppsActivity;->layoutIds:[I

    array-length v3, v3

    if-ge v1, v3, :cond_59

    .line 56
    iget-object v3, p0, Lcom/dumplingsandwich/pencilsketch/activities/DumplingSandwichAppsActivity;->layoutIds:[I

    aget v3, v3, v1

    invoke-virtual {p0, v3}, Lcom/dumplingsandwich/pencilsketch/activities/DumplingSandwichAppsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 57
    .local v2, "layout":Landroid/widget/LinearLayout;
    const v3, 0x7f0f02eb

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iget-object v4, p0, Lcom/dumplingsandwich/pencilsketch/activities/DumplingSandwichAppsActivity;->icons:[I

    aget v4, v4, v1

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 58
    const v3, 0x7f0f02ec

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iget-object v4, p0, Lcom/dumplingsandwich/pencilsketch/activities/DumplingSandwichAppsActivity;->titles:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    const v3, 0x7f0f02ed

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iget-object v4, p0, Lcom/dumplingsandwich/pencilsketch/activities/DumplingSandwichAppsActivity;->descriptions:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    const v3, 0x7f0f02ef

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 62
    .local v0, "appInstallButton":Landroid/widget/Button;
    const-string v3, "Install"

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 63
    new-instance v3, Lcom/dumplingsandwich/pencilsketch/activities/DumplingSandwichAppsActivity$1;

    invoke-direct {v3, p0, v2}, Lcom/dumplingsandwich/pencilsketch/activities/DumplingSandwichAppsActivity$1;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/DumplingSandwichAppsActivity;Landroid/widget/LinearLayout;)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 54
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 70
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
    .line 74
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 75
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_4e

    .line 96
    :goto_e
    invoke-virtual {p0, v0}, Lcom/dumplingsandwich/pencilsketch/activities/DumplingSandwichAppsActivity;->startActivity(Landroid/content/Intent;)V

    .line 97
    return-void

    .line 78
    :pswitch_12
    const-string v1, "market://details?id=com.dumplingsandwich.cartoonmaker"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_e

    .line 81
    :pswitch_1c
    const-string v1, "market://details?id=com.dumplingsandwich.photogifts"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_e

    .line 84
    :pswitch_26
    const-string v1, "market://details?id=com.dumplingsandwich.sketchmaster"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_e

    .line 87
    :pswitch_30
    const-string v1, "market://details?id=com.dumplingsandwich.androidtoolbox"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_e

    .line 90
    :pswitch_3a
    const-string v1, "market://details?id=com.dumplingsandwich.waterreflection"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_e

    .line 93
    :pswitch_44
    const-string v1, "market://details?id=com.dumplingsandwich.focuseffect"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_e

    .line 75
    :pswitch_data_4e
    .packed-switch 0x7f0f009a
        :pswitch_3a
        :pswitch_1c
        :pswitch_26
        :pswitch_12
        :pswitch_30
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
    const v0, 0x7f03001e

    invoke-virtual {p0, v0}, Lcom/dumplingsandwich/pencilsketch/activities/DumplingSandwichAppsActivity;->setContentView(I)V

    .line 49
    invoke-direct {p0}, Lcom/dumplingsandwich/pencilsketch/activities/DumplingSandwichAppsActivity;->display_featured_apps()V

    .line 50
    return-void
.end method
