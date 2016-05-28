.class Lcom/google/android/gms/tagmanager/zzcm$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tagmanager/zzcm$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/tagmanager/zzcm;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/tagmanager/zzs;Lcom/google/android/gms/tagmanager/zzcm$zzb;Lcom/google/android/gms/tagmanager/zzcm$zza;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzaRu:Lcom/google/android/gms/tagmanager/zzcm;


# direct methods
.method constructor <init>(Lcom/google/android/gms/tagmanager/zzcm;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzcm$2;->zzaRu:Lcom/google/android/gms/tagmanager/zzcm;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/tagmanager/zzs;)Lcom/google/android/gms/tagmanager/zzcl;
    .registers 5

    new-instance v0, Lcom/google/android/gms/tagmanager/zzcl;

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzcm$2;->zzaRu:Lcom/google/android/gms/tagmanager/zzcm;

    invoke-static {v1}, Lcom/google/android/gms/tagmanager/zzcm;->zza(Lcom/google/android/gms/tagmanager/zzcm;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzcm$2;->zzaRu:Lcom/google/android/gms/tagmanager/zzcm;

    invoke-static {v2}, Lcom/google/android/gms/tagmanager/zzcm;->zzb(Lcom/google/android/gms/tagmanager/zzcm;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2, p1}, Lcom/google/android/gms/tagmanager/zzcl;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/tagmanager/zzs;)V

    return-object v0
.end method
