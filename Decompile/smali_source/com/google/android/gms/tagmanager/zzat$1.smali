.class Lcom/google/android/gms/tagmanager/zzat$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/tagmanager/zzat;->zzh(Ljava/lang/String;J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzaQl:Lcom/google/android/gms/tagmanager/zzas;

.field final synthetic zzaQm:J

.field final synthetic zzaQn:Lcom/google/android/gms/tagmanager/zzat;

.field final synthetic zzxv:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/android/gms/tagmanager/zzat;Lcom/google/android/gms/tagmanager/zzas;JLjava/lang/String;)V
    .registers 7

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzat$1;->zzaQn:Lcom/google/android/gms/tagmanager/zzat;

    iput-object p2, p0, Lcom/google/android/gms/tagmanager/zzat$1;->zzaQl:Lcom/google/android/gms/tagmanager/zzas;

    iput-wide p3, p0, Lcom/google/android/gms/tagmanager/zzat$1;->zzaQm:J

    iput-object p5, p0, Lcom/google/android/gms/tagmanager/zzat$1;->zzxv:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzat$1;->zzaQn:Lcom/google/android/gms/tagmanager/zzat;

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzat;->zza(Lcom/google/android/gms/tagmanager/zzat;)Lcom/google/android/gms/tagmanager/zzau;

    move-result-object v0

    if-nez v0, :cond_20

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzcu;->zzAP()Lcom/google/android/gms/tagmanager/zzcu;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzat$1;->zzaQn:Lcom/google/android/gms/tagmanager/zzat;

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzat;->zzb(Lcom/google/android/gms/tagmanager/zzat;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzat$1;->zzaQl:Lcom/google/android/gms/tagmanager/zzas;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/tagmanager/zzcu;->zza(Landroid/content/Context;Lcom/google/android/gms/tagmanager/zzas;)V

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzat$1;->zzaQn:Lcom/google/android/gms/tagmanager/zzat;

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzcu;->zzAS()Lcom/google/android/gms/tagmanager/zzau;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/google/android/gms/tagmanager/zzat;->zza(Lcom/google/android/gms/tagmanager/zzat;Lcom/google/android/gms/tagmanager/zzau;)Lcom/google/android/gms/tagmanager/zzau;

    :cond_20
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzat$1;->zzaQn:Lcom/google/android/gms/tagmanager/zzat;

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzat;->zza(Lcom/google/android/gms/tagmanager/zzat;)Lcom/google/android/gms/tagmanager/zzau;

    move-result-object v0

    iget-wide v2, p0, Lcom/google/android/gms/tagmanager/zzat$1;->zzaQm:J

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzat$1;->zzxv:Ljava/lang/String;

    invoke-interface {v0, v2, v3, v1}, Lcom/google/android/gms/tagmanager/zzau;->zzg(JLjava/lang/String;)V

    return-void
.end method
