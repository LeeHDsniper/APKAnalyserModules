.class public Lcom/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "ImagePreprocessActivity.java"


# static fields
.field public static current:Landroid/graphics/Bitmap;


# instance fields
.field private imageView:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .registers 2

    .prologue
    .line 89
    sget-object v0, Lcom/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity;->current:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_9

    .line 91
    sget-object v0, Lcom/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity;->current:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 94
    :cond_9
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onBackPressed()V

    .line 95
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 45
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_3a

    .line 60
    :goto_7
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity;->imageView:Landroid/widget/ImageView;

    sget-object v1, Lcom/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity;->current:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 61
    return-void

    .line 48
    :pswitch_f
    sget-object v0, Lcom/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity;->current:Landroid/graphics/Bitmap;

    const/high16 v1, -0x3d4c0000

    invoke-static {v0, v1}, Lcom/dumplingsandwich/pencilsketch/processor/ColorImageProcessor;->rotateImage(Landroid/graphics/Bitmap;F)Landroid/graphics/Bitmap;

    move-result-object v0

    sput-object v0, Lcom/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity;->current:Landroid/graphics/Bitmap;

    goto :goto_7

    .line 51
    :pswitch_1a
    sget-object v0, Lcom/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity;->current:Landroid/graphics/Bitmap;

    const/high16 v1, 0x42b40000

    invoke-static {v0, v1}, Lcom/dumplingsandwich/pencilsketch/processor/ColorImageProcessor;->rotateImage(Landroid/graphics/Bitmap;F)Landroid/graphics/Bitmap;

    move-result-object v0

    sput-object v0, Lcom/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity;->current:Landroid/graphics/Bitmap;

    goto :goto_7

    .line 54
    :pswitch_25
    sget-object v0, Lcom/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity;->current:Landroid/graphics/Bitmap;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/dumplingsandwich/pencilsketch/processor/ColorImageProcessor;->flipImage(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v0

    sput-object v0, Lcom/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity;->current:Landroid/graphics/Bitmap;

    goto :goto_7

    .line 57
    :pswitch_2f
    sget-object v0, Lcom/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity;->current:Landroid/graphics/Bitmap;

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lcom/dumplingsandwich/pencilsketch/processor/ColorImageProcessor;->flipImage(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v0

    sput-object v0, Lcom/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity;->current:Landroid/graphics/Bitmap;

    goto :goto_7

    .line 45
    nop

    :pswitch_data_3a
    .packed-switch 0x7f0f00bb
        :pswitch_f
        :pswitch_1a
        :pswitch_25
        :pswitch_2f
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 27
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 28
    const v0, 0x7f030022

    invoke-virtual {p0, v0}, Lcom/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity;->setContentView(I)V

    .line 30
    sget-object v0, Lcom/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity;->current:Landroid/graphics/Bitmap;

    if-nez v0, :cond_1b

    .line 32
    const-string v0, "Error when loading this photo. If the image was from cloud storage, please make sure you have network connected."

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 33
    invoke-virtual {p0}, Lcom/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity;->finish()V

    .line 41
    :goto_1a
    return-void

    .line 38
    :cond_1b
    const v0, 0x7f0f00b4

    invoke-virtual {p0, v0}, Lcom/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity;->imageView:Landroid/widget/ImageView;

    .line 39
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity;->imageView:Landroid/widget/ImageView;

    sget-object v1, Lcom/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity;->current:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_1a
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .registers 4
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 66
    invoke-virtual {p0}, Lcom/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    .line 67
    .local v0, "inflater":Landroid/view/MenuInflater;
    const v1, 0x7f10000d

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 68
    const/4 v1, 0x1

    return v1
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 6
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 74
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_26

    .line 84
    :goto_7
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    return v1

    .line 77
    :pswitch_c
    sget-object v1, Lcom/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity;->current:Landroid/graphics/Bitmap;

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v1

    sput-object v1, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->original:Landroid/graphics/Bitmap;

    .line 78
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 79
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity;->startActivity(Landroid/content/Intent;)V

    .line 81
    invoke-virtual {p0}, Lcom/dumplingsandwich/pencilsketch/activities/ImagePreprocessActivity;->finish()V

    goto :goto_7

    .line 74
    nop

    :pswitch_data_26
    .packed-switch 0x7f0f031d
        :pswitch_c
    .end packed-switch
.end method
