.class Lcom/adobe/android/ui/widget/AdobeGalleryView$1;
.super Ljava/lang/Object;
.source "AdobeGalleryView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/android/ui/widget/AdobeGalleryView;->onKeyUp(ILandroid/view/KeyEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/android/ui/widget/AdobeGalleryView;


# direct methods
.method constructor <init>(Lcom/adobe/android/ui/widget/AdobeGalleryView;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/android/ui/widget/AdobeGalleryView;

    .prologue
    .line 1228
    iput-object p1, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView$1;->this$0:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 1231
    iget-object v0, p0, Lcom/adobe/android/ui/widget/AdobeGalleryView$1;->this$0:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    # invokes: Lcom/adobe/android/ui/widget/AdobeGalleryView;->dispatchUnpress()V
    invoke-static {v0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->access$000(Lcom/adobe/android/ui/widget/AdobeGalleryView;)V

    .line 1232
    return-void
.end method
