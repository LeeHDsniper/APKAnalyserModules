.class Lcom/google/android/gms/tagmanager/zzcm$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tagmanager/zzcm$zzb;


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

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzcm$1;->zzaRu:Lcom/google/android/gms/tagmanager/zzcm;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzAC()Ljava/util/concurrent/ScheduledExecutorService;
    .registers 2

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    return-object v0
.end method
