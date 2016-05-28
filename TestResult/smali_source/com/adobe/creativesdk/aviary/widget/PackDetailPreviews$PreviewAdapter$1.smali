.class Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter$1;
.super Ljava/lang/Object;
.source "PackDetailPreviews.java"

# interfaces
.implements Lit/sephiroth/android/library/picasso/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;->loadImage(Ljava/lang/String;Ljava/lang/String;Landroid/widget/ImageView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;

.field final synthetic val$imageTag:I

.field final synthetic val$imageView:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;Landroid/widget/ImageView;I)V
    .registers 4
    .param p1, "this$1"    # Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;

    .prologue
    .line 625
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter$1;->this$1:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter$1;->val$imageView:Landroid/widget/ImageView;

    iput p3, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter$1;->val$imageTag:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError()V
    .registers 1

    .prologue
    .line 631
    return-void
.end method

.method public onSuccess()V
    .registers 3

    .prologue
    .line 628
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter$1;->val$imageView:Landroid/widget/ImageView;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews$PreviewAdapter$1;->val$imageTag:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 629
    return-void
.end method
