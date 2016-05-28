.class Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity$PhotoFrameTask;
.super Landroid/os/AsyncTask;
.source "PhotoFrameActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PhotoFrameTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;


# direct methods
.method private constructor <init>(Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;)V
    .registers 2

    .prologue
    .line 134
    iput-object p1, p0, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity$PhotoFrameTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;
    .param p2, "x1"    # Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity$1;

    .prologue
    .line 134
    invoke-direct {p0, p1}, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity$PhotoFrameTask;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Integer;)Landroid/graphics/Bitmap;
    .registers 10
    .param p1, "drawableId"    # [Ljava/lang/Integer;

    .prologue
    .line 146
    iget-object v6, p0, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity$PhotoFrameTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;

    invoke-virtual {v6}, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v6

    invoke-interface {v6}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 147
    .local v0, "display":Landroid/view/Display;
    new-instance v5, Landroid/graphics/Point;

    invoke-direct {v5}, Landroid/graphics/Point;-><init>()V

    .line 148
    .local v5, "size":Landroid/graphics/Point;
    invoke-virtual {v0, v5}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 149
    iget v4, v5, Landroid/graphics/Point;->x:I

    .line 150
    .local v4, "screenWidth":I
    iget v3, v5, Landroid/graphics/Point;->y:I

    .line 152
    .local v3, "screenHeight":I
    iget-object v6, p0, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity$PhotoFrameTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;

    invoke-virtual {v6}, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const/4 v7, 0x0

    aget-object v7, p1, v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-static {v6, v7, v4, v3}, Lcom/dumplingsandwich/pencilsketch/utils/BitmapUtils;->decodeResource(Landroid/content/res/Resources;III)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 153
    .local v1, "frame":Landroid/graphics/Bitmap;
    sget-object v6, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->original:Landroid/graphics/Bitmap;

    invoke-static {v6, v1}, Lcom/dumplingsandwich/pencilsketch/processor/ColorImageProcessor;->addPhotoFrame(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 154
    .local v2, "frameResult":Landroid/graphics/Bitmap;
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 156
    return-object v2
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 134
    check-cast p1, [Ljava/lang/Integer;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity$PhotoFrameTask;->doInBackground([Ljava/lang/Integer;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .registers 3
    .param p1, "result"    # Landroid/graphics/Bitmap;

    .prologue
    .line 162
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity$PhotoFrameTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;

    # getter for: Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->progress_dialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->access$100(Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 163
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity$PhotoFrameTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;

    # getter for: Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->progress_dialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->access$100(Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 165
    :cond_15
    if-eqz p1, :cond_20

    .line 166
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity$PhotoFrameTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;

    # getter for: Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->mImageView:Landroid/widget/ImageView;
    invoke-static {v0}, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->access$200(Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;)Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 167
    :cond_20
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 134
    check-cast p1, Landroid/graphics/Bitmap;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity$PhotoFrameTask;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method protected onPreExecute()V
    .registers 2

    .prologue
    .line 138
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 139
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity$PhotoFrameTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;

    # getter for: Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->progress_dialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->access$100(Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-nez v0, :cond_18

    .line 140
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity$PhotoFrameTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;

    # getter for: Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->progress_dialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;->access$100(Lcom/dumplingsandwich/pencilsketch/activities/PhotoFrameActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 141
    :cond_18
    return-void
.end method
