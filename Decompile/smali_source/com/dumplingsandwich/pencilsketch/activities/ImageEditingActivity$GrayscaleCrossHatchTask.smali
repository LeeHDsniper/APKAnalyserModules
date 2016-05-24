.class Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$GrayscaleCrossHatchTask;
.super Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;
.source "ImageEditingActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GrayscaleCrossHatchTask"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;


# direct methods
.method private constructor <init>(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;)V
    .registers 3

    .prologue
    .line 269
    iput-object p1, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$GrayscaleCrossHatchTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$BaseAsyncTask;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$1;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;
    .param p2, "x1"    # Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$1;

    .prologue
    .line 269
    invoke-direct {p0, p1}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$GrayscaleCrossHatchTask;-><init>(Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Landroid/graphics/Bitmap;
    .registers 9
    .param p1, "option"    # [Ljava/lang/Void;

    .prologue
    .line 272
    iget-object v5, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$GrayscaleCrossHatchTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    invoke-virtual {v5}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v5

    invoke-interface {v5}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 274
    .local v0, "display":Landroid/view/Display;
    new-instance v4, Landroid/graphics/Point;

    invoke-direct {v4}, Landroid/graphics/Point;-><init>()V

    .line 275
    .local v4, "size":Landroid/graphics/Point;
    invoke-virtual {v0, v4}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 276
    iget v3, v4, Landroid/graphics/Point;->x:I

    .line 277
    .local v3, "screenWidth":I
    iget v2, v4, Landroid/graphics/Point;->y:I

    .line 279
    .local v2, "screenHeight":I
    iget-object v5, p0, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$GrayscaleCrossHatchTask;->this$0:Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;

    invoke-virtual {v5}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f020180

    invoke-static {v5, v6, v3, v2}, Lcom/dumplingsandwich/pencilsketch/utils/BitmapUtils;->decodeResource(Landroid/content/res/Resources;III)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 280
    .local v1, "mask":Landroid/graphics/Bitmap;
    sget-object v5, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity;->original:Landroid/graphics/Bitmap;

    const/high16 v6, 0x3f400000

    invoke-static {v5, v1, v6}, Lcom/dumplingsandwich/pencilsketch/processor/GrayscaleImageProcessor;->grayscaleCrossHatchSketch(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;F)Landroid/graphics/Bitmap;

    move-result-object v5

    return-object v5
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 269
    check-cast p1, [Ljava/lang/Void;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/dumplingsandwich/pencilsketch/activities/ImageEditingActivity$GrayscaleCrossHatchTask;->doInBackground([Ljava/lang/Void;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method
