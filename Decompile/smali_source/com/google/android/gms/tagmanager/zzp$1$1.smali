.class Lcom/google/android/gms/tagmanager/zzp$1$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tagmanager/zzo$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/tagmanager/zzp$1;->zza(Lcom/google/android/gms/internal/zzqo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzaPu:Lcom/google/android/gms/tagmanager/zzp$1;


# direct methods
.method constructor <init>(Lcom/google/android/gms/tagmanager/zzp$1;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzp$1$1;->zzaPu:Lcom/google/android/gms/tagmanager/zzp$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzey(Ljava/lang/String;)V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzp$1$1;->zzaPu:Lcom/google/android/gms/tagmanager/zzp$1;

    iget-object v0, v0, Lcom/google/android/gms/tagmanager/zzp$1;->zzaPt:Lcom/google/android/gms/tagmanager/zzp;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/tagmanager/zzp;->zzey(Ljava/lang/String;)V

    return-void
.end method

.method public zzzE()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzp$1$1;->zzaPu:Lcom/google/android/gms/tagmanager/zzp$1;

    iget-object v0, v0, Lcom/google/android/gms/tagmanager/zzp$1;->zzaPt:Lcom/google/android/gms/tagmanager/zzp;

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzp;->zzzE()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zzzG()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzp$1$1;->zzaPu:Lcom/google/android/gms/tagmanager/zzp$1;

    iget-object v0, v0, Lcom/google/android/gms/tagmanager/zzp$1;->zzaPt:Lcom/google/android/gms/tagmanager/zzp;

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzp;->zze(Lcom/google/android/gms/tagmanager/zzp;)Lcom/google/android/gms/tagmanager/zzcd;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/tagmanager/zzcd;->zzkp()Z

    move-result v0

    if-eqz v0, :cond_19

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzp$1$1;->zzaPu:Lcom/google/android/gms/tagmanager/zzp$1;

    iget-object v0, v0, Lcom/google/android/gms/tagmanager/zzp$1;->zzaPt:Lcom/google/android/gms/tagmanager/zzp;

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzp$1$1;->zzaPu:Lcom/google/android/gms/tagmanager/zzp$1;

    iget-object v1, v1, Lcom/google/android/gms/tagmanager/zzp$1;->zzaPs:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tagmanager/zzp;->load(Ljava/lang/String;)V

    :cond_19
    return-void
.end method
