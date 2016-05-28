.class Lcom/google/android/gms/tagmanager/zzo$zzb;
.super Landroid/os/Handler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/tagmanager/zzo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "zzb"
.end annotation


# instance fields
.field private final zzaPf:Lcom/google/android/gms/tagmanager/ContainerHolder$ContainerAvailableListener;

.field final synthetic zzaPg:Lcom/google/android/gms/tagmanager/zzo;


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_14

    const-string v0, "Don\'t know how to handle this message."

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    :goto_a
    return-void

    :pswitch_b
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/tagmanager/zzo$zzb;->zzeA(Ljava/lang/String;)V

    goto :goto_a

    nop

    :pswitch_data_14
    .packed-switch 0x1
        :pswitch_b
    .end packed-switch
.end method

.method protected zzeA(Ljava/lang/String;)V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzo$zzb;->zzaPf:Lcom/google/android/gms/tagmanager/ContainerHolder$ContainerAvailableListener;

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzo$zzb;->zzaPg:Lcom/google/android/gms/tagmanager/zzo;

    invoke-interface {v0, v1, p1}, Lcom/google/android/gms/tagmanager/ContainerHolder$ContainerAvailableListener;->onContainerAvailable(Lcom/google/android/gms/tagmanager/ContainerHolder;Ljava/lang/String;)V

    return-void
.end method
