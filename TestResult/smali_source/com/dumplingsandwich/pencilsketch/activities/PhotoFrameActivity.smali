.class public Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "PhotoFrameActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity$1;,
        Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity$PhotoFrameTask;
    }
.end annotation


# static fields
.field public static original:Landroid/graphics/Bitmap;


# instance fields
.field private files_to_delete:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field private mImageView:Landroid/widget/ImageView;

.field private progress_dialog:Landroid/app/ProgressDialog;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    .line 134
    return-void
.end method

.method static synthetic access$100(Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;)Landroid/app/ProgressDialog;
    .registers 2
    .param p0, "x0"    # Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->progress_dialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$200(Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;)Landroid/widget/ImageView;
    .registers 2
    .param p0, "x0"    # Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->mImageView:Landroid/widget/ImageView;

    return-object v0
.end method


# virtual methods
.method public onBackPressed()V
    .registers 3

    .prologue
    .line 173
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->files_to_delete:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_17

    .line 175
    iget-object v1, p0, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->files_to_delete:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 173
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 177
    :cond_17
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onBackPressed()V

    .line 178
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 81
    const v0, 0x7f020196

    .line 83
    .local v0, "drawableId":I
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    packed-switch v2, :pswitch_data_56

    .line 129
    :goto_a
    new-instance v1, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity$PhotoFrameTask;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity$PhotoFrameTask;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity$1;)V

    .line 130
    .local v1, "photoFrameTask":Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity$PhotoFrameTask;
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Integer;

    const/4 v3, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity$PhotoFrameTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 131
    return-void

    .line 86
    .end local v1    # "photoFrameTask":Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity$PhotoFrameTask;
    :pswitch_1e
    const v0, 0x7f020196

    .line 87
    goto :goto_a

    .line 89
    :pswitch_22
    const v0, 0x7f0201a2

    .line 90
    goto :goto_a

    .line 92
    :pswitch_26
    const v0, 0x7f0201a4

    .line 93
    goto :goto_a

    .line 95
    :pswitch_2a
    const v0, 0x7f0201a6

    .line 96
    goto :goto_a

    .line 98
    :pswitch_2e
    const v0, 0x7f0201a8

    .line 99
    goto :goto_a

    .line 101
    :pswitch_32
    const v0, 0x7f0201aa

    .line 102
    goto :goto_a

    .line 104
    :pswitch_36
    const v0, 0x7f0201ac

    .line 105
    goto :goto_a

    .line 107
    :pswitch_3a
    const v0, 0x7f0201ae

    .line 108
    goto :goto_a

    .line 110
    :pswitch_3e
    const v0, 0x7f0201b0

    .line 111
    goto :goto_a

    .line 113
    :pswitch_42
    const v0, 0x7f020197

    .line 114
    goto :goto_a

    .line 116
    :pswitch_46
    const v0, 0x7f020199

    .line 117
    goto :goto_a

    .line 119
    :pswitch_4a
    const v0, 0x7f02019b

    .line 120
    goto :goto_a

    .line 122
    :pswitch_4e
    const v0, 0x7f02019d

    .line 123
    goto :goto_a

    .line 125
    :pswitch_52
    const v0, 0x7f02019f

    goto :goto_a

    .line 83
    :pswitch_data_56
    .packed-switch 0x7f0f00cb
        :pswitch_1e
        :pswitch_22
        :pswitch_26
        :pswitch_2a
        :pswitch_2e
        :pswitch_32
        :pswitch_36
        :pswitch_3a
        :pswitch_3e
        :pswitch_42
        :pswitch_46
        :pswitch_4a
        :pswitch_4e
        :pswitch_52
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 38
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 39
    const v0, 0x7f030025

    invoke-virtual {p0, v0}, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->setContentView(I)V

    .line 41
    const v0, 0x7f0f00ca

    invoke-virtual {p0, v0}, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->mImageView:Landroid/widget/ImageView;

    .line 42
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->mImageView:Landroid/widget/ImageView;

    sget-object v1, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->original:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->files_to_delete:Ljava/util/ArrayList;

    .line 45
    const-string v0, "Processing..."

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/dumplingsandwich/pencilsketch/utils/UIUtils;->getLoadingIndicator(Landroid/content/Context;Ljava/lang/String;Z)Landroid/app/ProgressDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->progress_dialog:Landroid/app/ProgressDialog;

    .line 46
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .registers 4
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 51
    invoke-virtual {p0}, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    .line 52
    .local v0, "inflater":Landroid/view/MenuInflater;
    const v1, 0x7f10000a

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 53
    const/4 v1, 0x1

    return v1
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 7
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 59
    iget-object v2, p0, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    check-cast v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 60
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    packed-switch v2, :pswitch_data_3a

    .line 76
    :cond_13
    :goto_13
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v2

    return v2

    .line 63
    :pswitch_18
    const/4 v2, 0x1

    invoke-static {p0, v0, v2}, Lcom/dumplingsandwich/pencilsketch/utils/BitmapUtils;->saveImageOnPhone(Landroid/content/Context;Landroid/graphics/Bitmap;Z)Ljava/io/File;

    move-result-object v2

    if-eqz v2, :cond_13

    .line 65
    invoke-virtual {p0}, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "Image Saved in \"Pencil_Sketch\" Folder!"

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_13

    .line 69
    :pswitch_2e
    invoke-static {p0, v0}, Lcom/dumplingsandwich/pencilsketch/utils/BitmapUtils;->shareImage(Landroid/content/Context;Landroid/graphics/Bitmap;)Ljava/io/File;

    move-result-object v1

    .line 70
    .local v1, "temporatyShareFile":Ljava/io/File;
    if-eqz v1, :cond_13

    .line 72
    iget-object v2, p0, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->files_to_delete:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_13

    .line 60
    :pswitch_data_3a
    .packed-switch 0x7f0f0319
        :pswitch_18
        :pswitch_2e
    .end packed-switch
.end method
