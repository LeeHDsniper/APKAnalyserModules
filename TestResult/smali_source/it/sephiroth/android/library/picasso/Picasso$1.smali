.class final Lit/sephiroth/android/library/picasso/Picasso$1;
.super Landroid/os/Handler;
.source "Picasso.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/picasso/Picasso;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>(Landroid/os/Looper;)V
    .registers 2
    .param p1, "x0"    # Landroid/os/Looper;

    .prologue
    .line 103
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 12
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 105
    iget v6, p1, Landroid/os/Message;->what:I

    sparse-switch v6, :sswitch_data_82

    .line 136
    new-instance v6, Ljava/lang/AssertionError;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unknown handler message received: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p1, Landroid/os/Message;->what:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v6

    .line 107
    :sswitch_20
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Ljava/util/List;

    .line 109
    .local v2, "batch":Ljava/util/List;, "Ljava/util/List<Lit/sephiroth/android/library/picasso/BitmapHunter;>;"
    const/4 v4, 0x0

    .local v4, "i":I
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    .local v5, "n":I
    :goto_29
    if-ge v4, v5, :cond_5d

    .line 110
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lit/sephiroth/android/library/picasso/BitmapHunter;

    .line 111
    .local v3, "hunter":Lit/sephiroth/android/library/picasso/BitmapHunter;
    iget-object v6, v3, Lit/sephiroth/android/library/picasso/BitmapHunter;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    invoke-virtual {v6, v3}, Lit/sephiroth/android/library/picasso/Picasso;->complete(Lit/sephiroth/android/library/picasso/BitmapHunter;)V

    .line 109
    add-int/lit8 v4, v4, 0x1

    goto :goto_29

    .line 116
    .end local v2    # "batch":Ljava/util/List;, "Ljava/util/List<Lit/sephiroth/android/library/picasso/BitmapHunter;>;"
    .end local v3    # "hunter":Lit/sephiroth/android/library/picasso/BitmapHunter;
    .end local v4    # "i":I
    .end local v5    # "n":I
    :sswitch_39
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lit/sephiroth/android/library/picasso/Action;

    .line 117
    .local v0, "action":Lit/sephiroth/android/library/picasso/Action;
    invoke-virtual {v0}, Lit/sephiroth/android/library/picasso/Action;->getPicasso()Lit/sephiroth/android/library/picasso/Picasso;

    move-result-object v6

    iget-boolean v6, v6, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    if-eqz v6, :cond_54

    .line 118
    const-string v6, "Main"

    const-string v7, "canceled"

    iget-object v8, v0, Lit/sephiroth/android/library/picasso/Action;->request:Lit/sephiroth/android/library/picasso/Request;

    invoke-virtual {v8}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v8

    const-string v9, "target got garbage collected"

    invoke-static {v6, v7, v8, v9}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    :cond_54
    iget-object v6, v0, Lit/sephiroth/android/library/picasso/Action;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    invoke-virtual {v0}, Lit/sephiroth/android/library/picasso/Action;->getTarget()Ljava/lang/Object;

    move-result-object v7

    # invokes: Lit/sephiroth/android/library/picasso/Picasso;->cancelExistingRequest(Ljava/lang/Object;)V
    invoke-static {v6, v7}, Lit/sephiroth/android/library/picasso/Picasso;->access$000(Lit/sephiroth/android/library/picasso/Picasso;Ljava/lang/Object;)V

    .line 138
    .end local v0    # "action":Lit/sephiroth/android/library/picasso/Action;
    :cond_5d
    :goto_5d
    return-void

    .line 124
    :sswitch_5e
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    .line 126
    .local v1, "batch":Ljava/util/List;, "Ljava/util/List<Lit/sephiroth/android/library/picasso/Action;>;"
    const/4 v4, 0x0

    .restart local v4    # "i":I
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    .restart local v5    # "n":I
    :goto_67
    if-ge v4, v5, :cond_5d

    .line 127
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lit/sephiroth/android/library/picasso/Action;

    .line 128
    .restart local v0    # "action":Lit/sephiroth/android/library/picasso/Action;
    iget-object v6, v0, Lit/sephiroth/android/library/picasso/Action;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    invoke-virtual {v6, v0}, Lit/sephiroth/android/library/picasso/Picasso;->resumeAction(Lit/sephiroth/android/library/picasso/Action;)V

    .line 126
    add-int/lit8 v4, v4, 0x1

    goto :goto_67

    .line 132
    .end local v0    # "action":Lit/sephiroth/android/library/picasso/Action;
    .end local v1    # "batch":Ljava/util/List;, "Ljava/util/List<Lit/sephiroth/android/library/picasso/Action;>;"
    .end local v4    # "i":I
    .end local v5    # "n":I
    :sswitch_77
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Lit/sephiroth/android/library/picasso/BitmapHunter;

    .line 133
    .restart local v3    # "hunter":Lit/sephiroth/android/library/picasso/BitmapHunter;
    iget-object v6, v3, Lit/sephiroth/android/library/picasso/BitmapHunter;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    invoke-virtual {v6, v3}, Lit/sephiroth/android/library/picasso/Picasso;->complete(Lit/sephiroth/android/library/picasso/BitmapHunter;)V

    goto :goto_5d

    .line 105
    nop

    :sswitch_data_82
    .sparse-switch
        0x3 -> :sswitch_39
        0x8 -> :sswitch_20
        0xd -> :sswitch_5e
        0xe -> :sswitch_77
    .end sparse-switch
.end method
