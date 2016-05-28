.class Lcom/google/android/gms/tagmanager/DataLayer$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tagmanager/DataLayer$zzc$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/tagmanager/DataLayer;->zzzO()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzaPH:Lcom/google/android/gms/tagmanager/DataLayer;


# direct methods
.method constructor <init>(Lcom/google/android/gms/tagmanager/DataLayer;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/DataLayer$2;->zzaPH:Lcom/google/android/gms/tagmanager/DataLayer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzo(Ljava/util/List;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/tagmanager/DataLayer$zza;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_20

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/tagmanager/DataLayer$zza;

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/DataLayer$2;->zzaPH:Lcom/google/android/gms/tagmanager/DataLayer;

    iget-object v3, p0, Lcom/google/android/gms/tagmanager/DataLayer$2;->zzaPH:Lcom/google/android/gms/tagmanager/DataLayer;

    iget-object v4, v0, Lcom/google/android/gms/tagmanager/DataLayer$zza;->zztP:Ljava/lang/String;

    iget-object v0, v0, Lcom/google/android/gms/tagmanager/DataLayer$zza;->zzID:Ljava/lang/Object;

    invoke-virtual {v3, v4, v0}, Lcom/google/android/gms/tagmanager/DataLayer;->zzj(Ljava/lang/String;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/google/android/gms/tagmanager/DataLayer;->zza(Lcom/google/android/gms/tagmanager/DataLayer;Ljava/util/Map;)V

    goto :goto_4

    :cond_20
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/DataLayer$2;->zzaPH:Lcom/google/android/gms/tagmanager/DataLayer;

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/DataLayer;->zza(Lcom/google/android/gms/tagmanager/DataLayer;)Ljava/util/concurrent/CountDownLatch;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void
.end method
