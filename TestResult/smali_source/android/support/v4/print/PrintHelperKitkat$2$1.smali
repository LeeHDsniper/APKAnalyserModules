.class Landroid/support/v4/print/PrintHelperKitkat$2$1;
.super Landroid/os/AsyncTask;
.source "PrintHelperKitkat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/print/PrintHelperKitkat$2;->onLayout(Landroid/print/PrintAttributes;Landroid/print/PrintAttributes;Landroid/os/CancellationSignal;Landroid/print/PrintDocumentAdapter$LayoutResultCallback;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Landroid/net/Uri;",
        "Ljava/lang/Boolean;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Landroid/support/v4/print/PrintHelperKitkat$2;

.field final synthetic val$cancellationSignal:Landroid/os/CancellationSignal;

.field final synthetic val$layoutResultCallback:Landroid/print/PrintDocumentAdapter$LayoutResultCallback;

.field final synthetic val$newPrintAttributes:Landroid/print/PrintAttributes;

.field final synthetic val$oldPrintAttributes:Landroid/print/PrintAttributes;


# direct methods
.method constructor <init>(Landroid/support/v4/print/PrintHelperKitkat$2;Landroid/os/CancellationSignal;Landroid/print/PrintAttributes;Landroid/print/PrintAttributes;Landroid/print/PrintDocumentAdapter$LayoutResultCallback;)V
    .registers 6

    .prologue
    .line 332
    iput-object p1, p0, Landroid/support/v4/print/PrintHelperKitkat$2$1;->this$1:Landroid/support/v4/print/PrintHelperKitkat$2;

    iput-object p2, p0, Landroid/support/v4/print/PrintHelperKitkat$2$1;->val$cancellationSignal:Landroid/os/CancellationSignal;

    iput-object p3, p0, Landroid/support/v4/print/PrintHelperKitkat$2$1;->val$newPrintAttributes:Landroid/print/PrintAttributes;

    iput-object p4, p0, Landroid/support/v4/print/PrintHelperKitkat$2$1;->val$oldPrintAttributes:Landroid/print/PrintAttributes;

    iput-object p5, p0, Landroid/support/v4/print/PrintHelperKitkat$2$1;->val$layoutResultCallback:Landroid/print/PrintDocumentAdapter$LayoutResultCallback;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Landroid/net/Uri;)Landroid/graphics/Bitmap;
    .registers 5
    .param p1, "uris"    # [Landroid/net/Uri;

    .prologue
    .line 350
    :try_start_0
    iget-object v0, p0, Landroid/support/v4/print/PrintHelperKitkat$2$1;->this$1:Landroid/support/v4/print/PrintHelperKitkat$2;

    iget-object v0, v0, Landroid/support/v4/print/PrintHelperKitkat$2;->this$0:Landroid/support/v4/print/PrintHelperKitkat;

    iget-object v1, p0, Landroid/support/v4/print/PrintHelperKitkat$2$1;->this$1:Landroid/support/v4/print/PrintHelperKitkat$2;

    iget-object v1, v1, Landroid/support/v4/print/PrintHelperKitkat$2;->val$imageFile:Landroid/net/Uri;

    const/16 v2, 0xdac

    # invokes: Landroid/support/v4/print/PrintHelperKitkat;->loadConstrainedBitmap(Landroid/net/Uri;I)Landroid/graphics/Bitmap;
    invoke-static {v0, v1, v2}, Landroid/support/v4/print/PrintHelperKitkat;->access$200(Landroid/support/v4/print/PrintHelperKitkat;Landroid/net/Uri;I)Landroid/graphics/Bitmap;
    :try_end_d
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_d} :catch_f

    move-result-object v0

    .line 354
    :goto_e
    return-object v0

    .line 351
    :catch_f
    move-exception v0

    .line 354
    const/4 v0, 0x0

    goto :goto_e
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 332
    check-cast p1, [Landroid/net/Uri;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/support/v4/print/PrintHelperKitkat$2$1;->doInBackground([Landroid/net/Uri;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected onCancelled(Landroid/graphics/Bitmap;)V
    .registers 4
    .param p1, "result"    # Landroid/graphics/Bitmap;

    .prologue
    .line 379
    iget-object v0, p0, Landroid/support/v4/print/PrintHelperKitkat$2$1;->val$layoutResultCallback:Landroid/print/PrintDocumentAdapter$LayoutResultCallback;

    invoke-virtual {v0}, Landroid/print/PrintDocumentAdapter$LayoutResultCallback;->onLayoutCancelled()V

    .line 380
    iget-object v0, p0, Landroid/support/v4/print/PrintHelperKitkat$2$1;->this$1:Landroid/support/v4/print/PrintHelperKitkat$2;

    const/4 v1, 0x0

    iput-object v1, v0, Landroid/support/v4/print/PrintHelperKitkat$2;->mLoadBitmap:Landroid/os/AsyncTask;

    .line 381
    return-void
.end method

.method protected bridge synthetic onCancelled(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 332
    check-cast p1, Landroid/graphics/Bitmap;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/support/v4/print/PrintHelperKitkat$2$1;->onCancelled(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .registers 7
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v4, 0x0

    const/4 v0, 0x1

    .line 359
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 360
    iget-object v2, p0, Landroid/support/v4/print/PrintHelperKitkat$2$1;->this$1:Landroid/support/v4/print/PrintHelperKitkat$2;

    iput-object p1, v2, Landroid/support/v4/print/PrintHelperKitkat$2;->mBitmap:Landroid/graphics/Bitmap;

    .line 361
    if-eqz p1, :cond_36

    .line 362
    new-instance v2, Landroid/print/PrintDocumentInfo$Builder;

    iget-object v3, p0, Landroid/support/v4/print/PrintHelperKitkat$2$1;->this$1:Landroid/support/v4/print/PrintHelperKitkat$2;

    iget-object v3, v3, Landroid/support/v4/print/PrintHelperKitkat$2;->val$jobName:Ljava/lang/String;

    invoke-direct {v2, v3}, Landroid/print/PrintDocumentInfo$Builder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Landroid/print/PrintDocumentInfo$Builder;->setContentType(I)Landroid/print/PrintDocumentInfo$Builder;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/print/PrintDocumentInfo$Builder;->setPageCount(I)Landroid/print/PrintDocumentInfo$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/print/PrintDocumentInfo$Builder;->build()Landroid/print/PrintDocumentInfo;

    move-result-object v1

    .line 366
    .local v1, "info":Landroid/print/PrintDocumentInfo;
    iget-object v2, p0, Landroid/support/v4/print/PrintHelperKitkat$2$1;->val$newPrintAttributes:Landroid/print/PrintAttributes;

    iget-object v3, p0, Landroid/support/v4/print/PrintHelperKitkat$2$1;->val$oldPrintAttributes:Landroid/print/PrintAttributes;

    invoke-virtual {v2, v3}, Landroid/print/PrintAttributes;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_34

    .line 368
    .local v0, "changed":Z
    :goto_2a
    iget-object v2, p0, Landroid/support/v4/print/PrintHelperKitkat$2$1;->val$layoutResultCallback:Landroid/print/PrintDocumentAdapter$LayoutResultCallback;

    invoke-virtual {v2, v1, v0}, Landroid/print/PrintDocumentAdapter$LayoutResultCallback;->onLayoutFinished(Landroid/print/PrintDocumentInfo;Z)V

    .line 373
    .end local v0    # "changed":Z
    .end local v1    # "info":Landroid/print/PrintDocumentInfo;
    :goto_2f
    iget-object v2, p0, Landroid/support/v4/print/PrintHelperKitkat$2$1;->this$1:Landroid/support/v4/print/PrintHelperKitkat$2;

    iput-object v4, v2, Landroid/support/v4/print/PrintHelperKitkat$2;->mLoadBitmap:Landroid/os/AsyncTask;

    .line 374
    return-void

    .line 366
    .restart local v1    # "info":Landroid/print/PrintDocumentInfo;
    :cond_34
    const/4 v0, 0x0

    goto :goto_2a

    .line 371
    .end local v1    # "info":Landroid/print/PrintDocumentInfo;
    :cond_36
    iget-object v2, p0, Landroid/support/v4/print/PrintHelperKitkat$2$1;->val$layoutResultCallback:Landroid/print/PrintDocumentAdapter$LayoutResultCallback;

    invoke-virtual {v2, v4}, Landroid/print/PrintDocumentAdapter$LayoutResultCallback;->onLayoutFailed(Ljava/lang/CharSequence;)V

    goto :goto_2f
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 332
    check-cast p1, Landroid/graphics/Bitmap;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/support/v4/print/PrintHelperKitkat$2$1;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method protected onPreExecute()V
    .registers 3

    .prologue
    .line 337
    iget-object v0, p0, Landroid/support/v4/print/PrintHelperKitkat$2$1;->val$cancellationSignal:Landroid/os/CancellationSignal;

    new-instance v1, Landroid/support/v4/print/PrintHelperKitkat$2$1$1;

    invoke-direct {v1, p0}, Landroid/support/v4/print/PrintHelperKitkat$2$1$1;-><init>(Landroid/support/v4/print/PrintHelperKitkat$2$1;)V

    invoke-virtual {v0, v1}, Landroid/os/CancellationSignal;->setOnCancelListener(Landroid/os/CancellationSignal$OnCancelListener;)V

    .line 345
    return-void
.end method
