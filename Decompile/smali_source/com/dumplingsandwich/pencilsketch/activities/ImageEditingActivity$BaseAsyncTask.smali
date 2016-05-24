.class Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;
.super Landroid/os/AsyncTask;
.source "ImageEditingActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BaseAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;


# direct methods
.method private constructor <init>(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;)V
    .registers 2

    .prologue
    .line 222
    iput-object p1, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;
    .param p2, "x1"    # Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$1;

    .prologue
    .line 222
    invoke-direct {p0, p1}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Landroid/graphics/Bitmap;
    .registers 3
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 232
    const/4 v0, 0x0

    return-object v0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 222
    check-cast p1, [Ljava/lang/Void;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;->doInBackground([Ljava/lang/Void;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .registers 3
    .param p1, "result"    # Landroid/graphics/Bitmap;

    .prologue
    .line 237
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 238
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    # getter for: Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->progress_dialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->access$600(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_18

    .line 239
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    # getter for: Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->progress_dialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->access$600(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 241
    :cond_18
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    # getter for: Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->bitmapView:Landroid/widget/ImageView;
    invoke-static {v0}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->access$700(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;)Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 242
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 222
    check-cast p1, Landroid/graphics/Bitmap;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method protected onPreExecute()V
    .registers 2

    .prologue
    .line 225
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 226
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    # getter for: Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->progress_dialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->access$600(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-nez v0, :cond_18

    .line 227
    iget-object v0, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    # getter for: Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->progress_dialog:Landroid/app/ProgressDialog;
    invoke-static {v0}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->access$600(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;)Landroid/app/ProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 228
    :cond_18
    return-void
.end method
